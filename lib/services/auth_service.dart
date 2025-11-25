import '../core/constants/api_constants.dart';
import 'api_service.dart';
import 'storage_service.dart';

class AuthService {
  final ApiService _apiService = ApiService();

  // Request OTP
  Future<Map<String, dynamic>> requestOtp({
    required String phone,
    required int countryId,
  }) async {
    try {
      final response = await _apiService.postFormData(
        ApiConstants.requestOtp,
        data: {
          'phone': phone,
          'country_id': countryId.toString(),
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Verify OTP
  Future<Map<String, dynamic>> verifyOtp({
    required String phone,
    required String otp,
    required int countryId,
  }) async {
    try {
      final response = await _apiService.postFormData(
        ApiConstants.verifyOtp,
        data: {
          'phone': phone,
          'otp': otp,
          'country_id': countryId.toString(),
        },
      );

      // Save token and user data
      if (response.data['status'] == 'success') {
        final data = response.data['data'];
        await StorageService.saveToken(data['token']);
        await StorageService.saveUserId(data['user']['id']);
        await StorageService.savePhone(data['user']['phone']);
        await StorageService.saveIsCompleted(data['user']['is_completed'] ?? false);
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Resend OTP
  Future<Map<String, dynamic>> resendOtp({
    required String phone,
    required int countryId,
  }) async {
    try {
      final response = await _apiService.post(
        ApiConstants.resendOtp,
        data: {
          'phone': phone,
          'country_id': countryId,
        },
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      // The API doesn't have a logout endpoint (returns 404)
      // Just clear local storage
      await StorageService.clearAll();
    } catch (e) {
      // Always clear storage even if API call fails
      await StorageService.clearAll();
    }
  }

  // Check if logged in
  Future<bool> isLoggedIn() async {
    return await StorageService.isLoggedIn();
  }
}

