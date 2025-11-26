import 'package:dio/dio.dart';
import '../core/constants/api_constants.dart';
import 'storage_service.dart';
import 'session_manager.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;

  late final Dio _dio;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': ApiConstants.acceptHeader,
          'Accept-Language': ApiConstants.acceptLanguageHeader,
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add auth token if available
          final token = await StorageService.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          
          // Log request
          print('🚀 API Request: ${options.method} ${options.baseUrl}${options.path}');
          if (options.data != null) {
            print('📤 Request Data: ${options.data}');
          }
          if (options.queryParameters.isNotEmpty) {
            print('🔍 Query Params: ${options.queryParameters}');
          }
          
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Log response
          print('✅ API Response: ${response.statusCode} ${response.requestOptions.path}');
          print('📥 Response Data: ${response.data}');
          return handler.next(response);
        },
        onError: (error, handler) async {
          // Log error
          print('❌ API Error: ${error.response?.statusCode} ${error.requestOptions.path}');
          print('💥 Error Message: ${error.message}');
          if (error.response?.data != null) {
            print('📛 Error Data: ${error.response?.data}');
          }
          
          // Handle 401 errors (unauthorized) or token expiration
          if (error.response?.statusCode == 401) {
            print('🔒 Unauthorized - Token expired or invalid');
            await StorageService.clearAll();
            SessionManager().notifySessionExpired(
              'Your session has expired. Please log in again to continue.'
            );
          }
          
          // Handle 500 errors that indicate null user (token expired but not caught as 401)
          if (error.response?.statusCode == 500 &&
              error.response?.data != null) {
            final errorData = error.response!.data.toString();
            if (errorData.contains('on null') || 
                errorData.contains('Call to a member function')) {
              print('🔒 Session expired - User is null on backend');
              await StorageService.clearAll();
              SessionManager().notifySessionExpired(
                'Your session has expired. Please log in again to continue.'
              );
            }
          }
          
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;

  // GET request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  // POST request
  Future<Response> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  // POST request with FormData
  Future<Response> postFormData(
    String endpoint, {
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final formData = FormData.fromMap(data);
      return await _dio.post(
        endpoint,
        data: formData,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  // PUT request
  Future<Response> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  // DELETE request
  Future<Response> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
}

