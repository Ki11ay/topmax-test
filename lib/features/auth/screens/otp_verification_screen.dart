import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/auth_provider.dart';
import '../widgets/otp_input_field.dart';

class OtpVerificationScreen extends ConsumerStatefulWidget {
  final String phone;
  final int countryId;

  const OtpVerificationScreen({
    super.key,
    required this.phone,
    required this.countryId,
  });

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  String _otp = '';
  int _resendTimer = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _resendTimer = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_resendTimer > 0) {
            _resendTimer--;
          } else {
            _canResend = true;
            _timer?.cancel();
          }
        });
      }
    });
  }

  Future<void> _verifyOtp() async {
    if (_otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 6-digit OTP'),
          backgroundColor: AppConstants.errorColor,
        ),
      );
      return;
    }

    final authNotifier = ref.read(authProvider.notifier);
    
    // Show loading indicator
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            SizedBox(width: 16),
            Text('Verifying OTP...'),
          ],
        ),
        duration: Duration(seconds: 30),
      ),
    );

    final success = await authNotifier.verifyOtp(
      phone: widget.phone,
      otp: _otp,
      countryId: widget.countryId,
    );

    if (!mounted) return;

    // Hide loading indicator
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (success) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✓ Login successful!'),
          backgroundColor: AppConstants.successColor,
          duration: Duration(seconds: 2),
        ),
      );
      
      // Navigate to home using context.go
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      context.go('/home');
    } else {
      final error = ref.read(authProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Failed to verify OTP'),
          backgroundColor: AppConstants.errorColor,
        ),
      );
    }
  }

  Future<void> _resendOtp() async {
    if (!_canResend) return;

    final authNotifier = ref.read(authProvider.notifier);
    final success = await authNotifier.resendOtp(
      phone: widget.phone,
      countryId: widget.countryId,
    );

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP sent successfully'),
          backgroundColor: AppConstants.successColor,
        ),
      );
      _startTimer();
    } else {
      final error = ref.read(authProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Failed to resend OTP'),
          backgroundColor: AppConstants.errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify OTP'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppConstants.paddingLarge),
              Text(
                'Verification Code',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                'We have sent a verification code to',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppConstants.textSecondary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingSmall),
              Text(
                widget.phone,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.paddingExtraLarge),
              OtpInputField(
                length: 6,
                onCompleted: (otp) {
                  setState(() {
                    _otp = otp;
                  });
                },
              ),
              const SizedBox(height: AppConstants.paddingLarge),
              ElevatedButton(
                onPressed: authState.isLoading ? null : _verifyOtp,
                child: authState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Text('Verify OTP'),
              ),
              const SizedBox(height: AppConstants.paddingMedium),
              TextButton(
                onPressed: _canResend && !authState.isLoading
                    ? _resendOtp
                    : null,
                child: Text(
                  _canResend
                      ? "Didn't receive a code?"
                      : "Resend code in $_resendTimer s",
                  style: TextStyle(
                    color: _canResend
                        ? AppConstants.textPrimary
                        : AppConstants.textSecondary,
                    decoration: _canResend ? TextDecoration.underline : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

