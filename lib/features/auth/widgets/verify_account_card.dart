import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import 'otp_input_field.dart';

class VerifyAccountCard extends StatelessWidget {
  final String phone;
  final String otp;
  final bool isLoading;
  final bool canResend;
  final int resendTimer;
  final Function(String) onOtpCompleted;
  final VoidCallback onVerifyOtp;
  final VoidCallback onResendOtp;
  final OtpInputFieldController? otpController;

  const VerifyAccountCard({
    super.key,
    required this.phone,
    required this.otp,
    required this.isLoading,
    required this.canResend,
    required this.resendTimer,
    required this.onOtpCompleted,
    required this.onVerifyOtp,
    required this.onResendOtp,
    this.otpController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 40,
      ),
      width: 400,
      height: 390,
      decoration: BoxDecoration(
        color: AppConstants.cardColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Verify Your Phone Number",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
              fontFamily: 'DM Sans',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Enter the verification code sent to your phone number ending in ****${phone.substring(phone.length - 4)}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: AppConstants.textSecondary,
              fontFamily: 'DM Sans',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          OtpInputField(
            length: 6,
            onCompleted: onOtpCompleted,
            controller: otpController,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(360, 50),
              backgroundColor: AppConstants.buttonBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: isLoading ? null : onVerifyOtp,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Verify',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: canResend && !isLoading ? onResendOtp : null,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  const TextSpan(
                    text: "Didn't receive a code? ",
                    style: TextStyle(
                      color: AppConstants.textSecondary,
                    ),
                  ),
                  TextSpan(
                    text: canResend ? "Resend" : "Resend in ${resendTimer}s",
                    style: TextStyle(
                      color: canResend
                          ? AppConstants.buttonBlue
                          : AppConstants.textSecondary,
                      decoration:
                          canResend ? TextDecoration.underline : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

