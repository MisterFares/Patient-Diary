// lib/presentation/pages/auth/verification.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/widgets/buttons/primary_button.dart';
import 'package:project/presentation/pages/auth/sign_in.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SizedBox(
            width: 335,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthTitle(title: 'Verify Phone No'),
                const SizedBox(height: 16),
                const FormLabel(text: 'Enter the OTP'),
                const SizedBox(height: 8),
                const OTPInputFields(),
                const SizedBox(height: 25),
                PrimaryButton(
                  width: double.infinity,
                  text: 'Validate OTP',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppConstants.routeMain);
                  },
                ),
                const SizedBox(height: 38),
                const ResendOTPText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPInputFields extends StatelessWidget {
  const OTPInputFields({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 58.6,
          height: 50,
          child: TextField(
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppConstants.backgroundLight,
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        );
      }),
    );
  }
}

class ResendOTPText extends StatelessWidget {
  const ResendOTPText({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(fontSize: 14),
          children: [
            TextSpan(
              text: "Didn't receive the OTP? ",
              style: TextStyle(
                color: AppConstants.textTertiary,
                fontFamily: AppConstants.fontFamily,
              ),
            ),
            TextSpan(
              text: 'Resend OTP',
              style: TextStyle(
                color: AppConstants.primaryColor,
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}