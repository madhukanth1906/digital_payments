import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flexpay_app/core/theme/app_colors.dart';
import 'package:flexpay_app/core/theme/app_text_styles.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  final MobileScannerController _controller = MobileScannerController(
    formats: <BarcodeFormat>[BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
  );

  String _statusText = 'Point camera at QR code';
  bool _isHandled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isHandled) {
      return;
    }

    final Barcode? code =
        capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
    final String? value = code?.rawValue;
    if (value == null || value.isEmpty) {
      return;
    }

    _isHandled = true;
    setState(() {
      _statusText = 'Scanned: $value';
    });

    final String normalized = value.toLowerCase().trim();
    final bool isGood = normalized.contains('good') ||
        normalized.contains('safe') ||
        normalized.contains('trusted') ||
        normalized.contains('success');
    final bool isFraud = normalized.contains('bad') ||
        normalized.contains('fraud') ||
        normalized.contains('suspicious') ||
        normalized.contains('blocked');

    final String targetRoute = isGood
        ? '/security/good-rating'
        : isFraud
            ? '/security/fraud-alert'
            : '/security/fraud-alert';

    Future<void>.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) {
        return;
      }
      context.go(targetRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const Expanded(
                    child: Text(
                      'Scan QR',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h5,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _controller.toggleTorch(),
                    icon: const Icon(Icons.flashlight_on, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Text(
                _statusText,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.secondary, width: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
