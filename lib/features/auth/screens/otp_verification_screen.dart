import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/auth_provider.dart';
import '../widgets/verify_account_card.dart';
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
  final OtpInputFieldController _otpController = OtpInputFieldController();

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
      // Clear OTP fields
      _otpController.clear();
      setState(() {
        _otp = '';
      });
      
      final error = ref.read(authProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Please re-enter the OTP',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  '💡 Test Hint: Use OTP code 123456',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: AppConstants.errorColor,
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
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
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 68,
                left: 0,
                child: Image.asset(
                  'assets/icons/create2.png',
                  height: 571,
                  width: 440,
                ),
              ),
              Positioned(
                top: 533,
                left: 0,
                child: VerifyAccountCard(
                  phone: widget.phone,
                  otp: _otp,
                  isLoading: authState.isLoading,
                  canResend: _canResend,
                  resendTimer: _resendTimer,
                  onOtpCompleted: (otp) {
                    setState(() {
                      _otp = otp;
                    });
                  },
                  onVerifyOtp: _verifyOtp,
                  onResendOtp: _resendOtp,
                  otpController: _otpController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

