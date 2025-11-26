import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/api_service.dart';

// Auth state
class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;
  final bool isAuthenticated;

  AuthState({
    this.isLoading = false,
    this.user,
    this.error,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? error,
    bool? isAuthenticated,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService = AuthService();

  AuthNotifier() : super(AuthState()) {
    checkAuthStatus();
  }

  // Check if user is already logged in
  Future<void> checkAuthStatus() async {
    final isLoggedIn = await _authService.isLoggedIn();
    state = state.copyWith(isAuthenticated: isLoggedIn);
  }

  // Request OTP
  Future<bool> requestOtp({
    required String phone,
    required int countryId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _authService.requestOtp(
        phone: phone,
        countryId: countryId,
      );

      if (response['status'] == 'success') {
        state = state.copyWith(isLoading: false);
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response['message'] ?? 'Failed to send OTP',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Verify OTP
  Future<bool> verifyOtp({
    required String phone,
    required String otp,
    required int countryId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _authService.verifyOtp(
        phone: phone,
        otp: otp,
        countryId: countryId,
      );

      if (response['status'] == 'success') {
        final userData = response['data']['user'];
        final user = User.fromJson(userData);
        state = state.copyWith(
          isLoading: false,
          user: user,
          isAuthenticated: true,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response['message'] ?? 'Failed to verify OTP',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Resend OTP
  Future<bool> resendOtp({
    required String phone,
    required int countryId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await _authService.resendOtp(
        phone: phone,
        countryId: countryId,
      );

      if (response['status'] == 'success') {
        state = state.copyWith(isLoading: false);
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response['message'] ?? 'Failed to resend OTP',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _authService.logout();
      // Reset to initial state (not authenticated)
      state = AuthState(
        isLoading: false,
        isAuthenticated: false,
        user: null,
        error: null,
      );
    } catch (e) {
      // Even if logout fails, reset the state
      state = AuthState(
        isLoading: false,
        isAuthenticated: false,
        user: null,
        error: null,
      );
    }
  }

  // Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Auth provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

// Countries provider
final countriesProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final apiService = ApiService();
  final response = await apiService.get('location/countries');
  return List<Map<String, dynamic>>.from(response.data['data']);
});

// API service provider
final apiServiceProvider = Provider((ref) {
  return ApiService();
});

