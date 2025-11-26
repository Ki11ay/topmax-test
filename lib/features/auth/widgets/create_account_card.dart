import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../utils/validators.dart';
import 'phone_input_field.dart';

class CreateAccountCard extends StatelessWidget {
  final TextEditingController phoneController;
  final bool isLoading;
  final VoidCallback onSendOtp;

  const CreateAccountCard({
    super.key,
    required this.phoneController,
    required this.isLoading,
    required this.onSendOtp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        width: 400,
        height: 375,
        decoration: BoxDecoration(
          color: AppConstants.cardColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Let's Get Started",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
              fontFamily: 'DM Sans',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            "Continue with your phone number to access\n your personalized Himma experience.",
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
          PhoneInputField(
            controller: phoneController,
            validator: Validators.validatePhone,
            enabled: !isLoading,
          ),
          const SizedBox(height: 20),
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
            onPressed: isLoading ? null : onSendOtp,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text('Continue', style: TextStyle(fontFamily: 'DM Sans', fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
          ),
          const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppConstants.textSecondary,
                  fontFamily: 'DM Sans',
                ),
                children: [
                  const TextSpan(text: "By continuing, you agree to our "),
                  TextSpan(
                    text: "Terms of Service",
                    style: const TextStyle(
                      color: AppConstants.buttonBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy.",
                    style: const TextStyle(
                      color: AppConstants.buttonBlue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
        ],
        ),
      ),
    );
  }
}

