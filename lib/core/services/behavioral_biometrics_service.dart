import 'dart:async';
import 'dart:math' as math;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flexpay_app/core/constants/app_constants.dart';
import 'package:flexpay_app/core/utils/helpers.dart';

class BehavioralBiometricsService {
  BehavioralBiometricsService._internal();

  static final BehavioralBiometricsService _instance =
      BehavioralBiometricsService._internal();

  factory BehavioralBiometricsService() => _instance;

  final Map<String, List<Map<String, dynamic>>> _patterns = {
    'physical': <Map<String, dynamic>>[],
    'temporal': <Map<String, dynamic>>[],
    'spatial': <Map<String, dynamic>>[],
    'cognitive': <Map<String, dynamic>>[],
  };

  final List<StreamSubscription<dynamic>> _subscriptions =
      <StreamSubscription<dynamic>>[];

  static const List<String> physicalPatterns = <String>[
    'gripPressure',
    'keystrokeDynamics',
    'thumbReachMap',
    'touchPressureCurve',
    'scrollRhythm',
    'tapCadence',
    'swipeAngleVariance',
    'microTremor',
    'fingerAreaUsage',
    'phoneTiltHabit',
    'gestureSequence',
    'typingBurstPattern',
  ];

  static const List<String> temporalPatterns = <String>[
    'activeHours',
    'sessionLength',
    'transactionTiming',
    'weekdayWeekendSplit',
    'decisionLatency',
    'retryLatency',
    'sleepWakeWindow',
    'paymentFrequency',
    'idleGaps',
    'commuteWindow',
    'notificationResponseDelay',
    'billCycleTiming',
    'monthlySpendPulse',
  ];

  static const List<String> spatialPatterns = <String>[
    'homeZone',
    'workZone',
    'commonMerchantRadius',
    'gpsAccuracyPattern',
    'tripPathShape',
    'transactionHeatmap',
    'deviceOrientationByLocation',
    'wifiSignatureMix',
    'bluetoothContext',
    'travelVelocity',
    'locationConfidence',
    'crossCityTransitions',
    'geoFenceEntryOrder',
    'checkoutLocationDistance',
  ];

  static const List<String> cognitivePatterns = <String>[
    'amountRounding',
    'merchantPreference',
    'payeeSequence',
    'budgetGuardrail',
    'riskResponseStyle',
    'confirmationReviewTime',
    'offerSensitivity',
    'loanRepaymentBias',
  ];

  int get totalSupportedPatterns =>
      physicalPatterns.length +
      temporalPatterns.length +
      spatialPatterns.length +
      cognitivePatterns.length;

  Future<void> initialize() async {
    await _captureDeviceContext();
  }

  void startPassiveCollection() {
    _subscriptions.add(
      accelerometerEventStream().listen((AccelerometerEvent event) {
        final gripPressure = math.sqrt(
          event.x * event.x + event.y * event.y + event.z * event.z,
        );
        _recordPattern('physical', 'gripPressure', gripPressure);
      }),
    );

    _subscriptions.add(
      gyroscopeEventStream().listen((GyroscopeEvent event) {
        final tremor = (event.x.abs() + event.y.abs() + event.z.abs()) / 3;
        _recordPattern('physical', 'microTremor', tremor);
      }),
    );
  }

  Future<void> stopPassiveCollection() async {
    for (final StreamSubscription<dynamic> subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
  }

  Future<void> captureLocationSnapshot() async {
    final Position position = await Geolocator.getCurrentPosition();
    _recordPattern('spatial', 'locationSnapshot', <String, dynamic>{
      'latitude': position.latitude,
      'longitude': position.longitude,
      'accuracy': position.accuracy,
      'timestamp': position.timestamp.millisecondsSinceEpoch,
    });
  }

  void captureKeystroke(String key, int timestamp, {double pressure = 0}) {
    final Map<String, dynamic>? last = _getLastByName(
      'physical',
      'keystrokeDynamics',
    );
    final int latency =
        last == null ? 0 : timestamp - (last['timestamp'] as int? ?? timestamp);

    _recordPattern('physical', 'keystrokeDynamics', <String, dynamic>{
      'key': key,
      'timestamp': timestamp,
      'latency': latency,
      'pressure': pressure,
    });
  }

  void trackTransactionTiming() {
    final DateTime now = DateTime.now();
    _recordPattern('temporal', 'transactionTiming', <String, dynamic>{
      'hour': now.hour,
      'weekday': now.weekday,
    });
  }

  void trackDecisionLatency(int showTime, int confirmTime) {
    _recordPattern('temporal', 'decisionLatency', confirmTime - showTime);
  }

  void trackAmountPreference(double amount) {
    final bool isRounded = amount % 10 == 0;
    final String roundingLevel = amount % 100 == 0
        ? 'hundred'
        : amount % 50 == 0
            ? 'fifty'
            : amount % 10 == 0
                ? 'ten'
                : 'exact';

    _recordPattern('cognitive', 'amountRounding', <String, dynamic>{
      'amount': amount,
      'isRounded': isRounded,
      'roundingLevel': roundingLevel,
    });
  }

  Future<VerificationResult> verifyPatterns(
    Map<String, List<Map<String, dynamic>>> candidate,
  ) async {
    final double physicalScore = _compareCategory(
      'physical',
      physicalPatterns,
      candidate['physical'] ?? <Map<String, dynamic>>[],
    );
    final double temporalScore = _compareCategory(
      'temporal',
      temporalPatterns,
      candidate['temporal'] ?? <Map<String, dynamic>>[],
    );
    final double spatialScore = _compareCategory(
      'spatial',
      spatialPatterns,
      candidate['spatial'] ?? <Map<String, dynamic>>[],
    );
    final double cognitiveScore = _compareCategory(
      'cognitive',
      cognitivePatterns,
      candidate['cognitive'] ?? <Map<String, dynamic>>[],
    );

    final double overall = Helpers.clampScore(
      (physicalScore + temporalScore + spatialScore + cognitiveScore) / 4,
    );

    final List<String> mismatches = _findMismatches(candidate);

    return VerificationResult(
      verified: overall >= AppConstants.minimumVerifiedScore,
      score: overall,
      physicalScore: physicalScore,
      temporalScore: temporalScore,
      spatialScore: spatialScore,
      cognitiveScore: cognitiveScore,
      mismatches: mismatches,
      riskLevel: _calculateRiskLevel(overall, mismatches),
    );
  }

  double _compareCategory(
    String category,
    List<String> requiredPatterns,
    List<Map<String, dynamic>> candidate,
  ) {
    final List<Map<String, dynamic>> baseline =
        _patterns[category] ?? <Map<String, dynamic>>[];
    if (baseline.isEmpty || candidate.isEmpty) {
      return 0.5;
    }

    final Set<String> baselineNames = baseline
        .map((Map<String, dynamic> entry) => entry['name'] as String)
        .toSet();
    final Set<String> candidateNames = candidate
        .map((Map<String, dynamic> entry) => entry['name'] as String)
        .toSet();

    int matches = 0;
    for (final String pattern in requiredPatterns) {
      if (baselineNames.contains(pattern) && candidateNames.contains(pattern)) {
        matches++;
      }
    }

    final double coverage = matches / requiredPatterns.length;
    return Helpers.clampScore(0.6 + (coverage * 0.4));
  }

  List<String> _findMismatches(
    Map<String, List<Map<String, dynamic>>> candidate,
  ) {
    final List<String> mismatches = <String>[];
    for (final String category in _patterns.keys) {
      final Set<String> baseline =
          (_patterns[category] ?? <Map<String, dynamic>>[])
              .map((Map<String, dynamic> item) => item['name'] as String)
              .toSet();
      final Set<String> incoming =
          (candidate[category] ?? <Map<String, dynamic>>[])
              .map((Map<String, dynamic> item) => item['name'] as String)
              .toSet();
      mismatches.addAll(baseline.difference(incoming).toList());
    }
    return mismatches;
  }

  String _calculateRiskLevel(double score, List<String> mismatches) {
    if (score > 0.9 && mismatches.length <= 2) {
      return 'low';
    }
    if (score > 0.75 && mismatches.length <= 6) {
      return 'medium';
    }
    return 'high';
  }

  Future<void> _captureDeviceContext() async {
    final DeviceInfoPlugin plugin = DeviceInfoPlugin();
    final BaseDeviceInfo info = await plugin.deviceInfo;
    _recordPattern('physical', 'deviceContext', info.data);
  }

  Map<String, dynamic>? _getLastByName(String category, String name) {
    final List<Map<String, dynamic>> list =
        _patterns[category] ?? <Map<String, dynamic>>[];
    for (int i = list.length - 1; i >= 0; i--) {
      if (list[i]['name'] == name) {
        return list[i];
      }
    }
    return null;
  }

  void _recordPattern(String category, String patternName, dynamic data) {
    _patterns[category]?.add(<String, dynamic>{
      'name': patternName,
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Map<String, List<Map<String, dynamic>>> exportPatterns() {
    return <String, List<Map<String, dynamic>>>{
      for (final MapEntry<String, List<Map<String, dynamic>>> entry
          in _patterns.entries)
        entry.key: List<Map<String, dynamic>>.from(entry.value),
    };
  }
}

class VerificationResult {
  VerificationResult({
    required this.verified,
    required this.score,
    required this.physicalScore,
    required this.temporalScore,
    required this.spatialScore,
    required this.cognitiveScore,
    required this.mismatches,
    required this.riskLevel,
  });

  final bool verified;
  final double score;
  final double physicalScore;
  final double temporalScore;
  final double spatialScore;
  final double cognitiveScore;
  final List<String> mismatches;
  final String riskLevel;
}
