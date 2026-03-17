import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flexpay_app/core/constants/api_constants.dart';

class ApiService {
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await _refreshToken();
          }
          handler.next(error);
        },
      ),
    );
  }

  late final Dio _dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Map<String, dynamic>> signup(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.authSignup, data: data);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> login(String phone, String pin) async {
    final response = await _dio.post(
      ApiConstants.authLogin,
      data: {'phone': phone, 'pin': pin},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getBalance() async {
    final response = await _dio.get(ApiConstants.userBalance);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> initiatePayment(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post(ApiConstants.paymentsInitiate, data: data);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> executePayment(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.paymentsExecute, data: data);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getTrustScore() async {
    final response = await _dio.get(ApiConstants.trustScore);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> submitBehavioralData(
    Map<String, dynamic> data,
  ) async {
    final response = await _dio.post(ApiConstants.behavioralData, data: data);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> reportFraud(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.fraudReport, data: data);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> getPoolStatus() async {
    final response = await _dio.get(ApiConstants.poolStatus);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> requestLoan(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.requestLoan, data: data);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<void> _refreshToken() async {
    // Token refresh hook for backend integration.
  }
}
