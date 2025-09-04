// lib/presentation/pages/auth/sign_in.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/widgets/buttons/primary_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                const AuthTitle(title: 'Sign In'),
                const SizedBox(height: 16),
                const FormLabel(text: 'Mobile Number'),
                const SizedBox(height: 8),
                const PhoneNumberField(),
                const SizedBox(height: 25),
                PrimaryButton(
                  width: double.infinity,
                  text: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, AppConstants.routeVerification);
                  },
                ),
                const SizedBox(height: 25),
                const GoogleSignInButton(),
                const SizedBox(height: 53),
                const TermsAndConditionsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Reusable components for SignIn screen
class AuthTitle extends StatelessWidget {
  final String title;
  
  const AuthTitle({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppConstants.textPrimary,
        fontFamily: AppConstants.fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class FormLabel extends StatelessWidget {
  final String text;
  
  const FormLabel({super.key, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppConstants.primaryColor,
        fontFamily: AppConstants.fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppConstants.backgroundLight,
          hintText: '+91 | 7500190739',
          hintStyle: const TextStyle(
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppConstants.textSecondary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstants.routeMain);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppConstants.textSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: const BorderSide(color: AppConstants.borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 10),
            const Text(
              'Continue with Google',
              style: TextStyle(
                fontFamily: AppConstants.fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: 'By continuing you agree to our ',
              style: TextStyle(
                color: AppConstants.textTertiary,
                fontFamily: AppConstants.fontFamily,
              ),
            ),
            TextSpan(
              text: 'Terms of service\n',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppConstants.textSecondary,
              ),
            ),
            TextSpan(
              text: 'and ',
              style: TextStyle(
                color: AppConstants.textTertiary,
                fontFamily: AppConstants.fontFamily,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppConstants.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}