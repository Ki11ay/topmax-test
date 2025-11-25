import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../state/auth_provider.dart';
import '../widgets/create_account_card.dart';
import 'otp_verification_screen.dart';

class PhoneInputScreen extends ConsumerStatefulWidget {
  const PhoneInputScreen({super.key});

  @override
  ConsumerState<PhoneInputScreen> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends ConsumerState<PhoneInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  int? _selectedCountryId;
  List<Map<String, dynamic>> _countries = [];

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    try {
      final apiService = ref.read(apiServiceProvider);
      final response = await apiService.get('location/countries');
      if (mounted) {
        setState(() {
          _countries = List<Map<String, dynamic>>.from(response.data['data']);
          // Set default country to Saudi Arabia (id: 1)
          if (_countries.isNotEmpty) {
            _selectedCountryId = 1;
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load countries: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) {
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
            Text('Sending OTP...'),
          ],
        ),
        duration: Duration(seconds: 30),
      ),
    );

    final success = await authNotifier.requestOtp(
      phone: _phoneController.text,
      countryId: _selectedCountryId!,
    );

    if (!mounted) return;

    // Hide loading indicator
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    if (success) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✓ OTP sent successfully!'),
          backgroundColor: AppConstants.successColor,
          duration: Duration(seconds: 2),
        ),
      );
      
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpVerificationScreen(
            phone: _phoneController.text,
            countryId: _selectedCountryId!,
          ),
        ),
      );
    } else {
      final error = ref.read(authProvider).error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error ?? 'Failed to send OTP'),
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
            // vertical: 40,
          ),
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Positioned(
                  top: 68,
                  left: 0,
                  child: Image.asset('assets/icons/create1.png',
                height: 571,
                width: 440,
                ),),
                Positioned(
                  top: 548,
                  left: 0,
                  child: CreateAccountCard(
                    phoneController: _phoneController,
                    isLoading: authState.isLoading,
                    onSendOtp: _sendOtp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

