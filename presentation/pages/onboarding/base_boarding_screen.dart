// lib/presentation/pages/onboarding/base_onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:project/core/constants/app_constants.dart';
import 'package:project/core/widgets/buttons/primary_button.dart';
import 'package:project/core/widgets/buttons/secondary_button.dart';

abstract class BaseOnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String dotsImagePath;
  final bool showSkipButton;
  final String nextButtonText;
  final String nextRoute;
  
  const BaseOnboardingScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.dotsImagePath,
    this.showSkipButton = true,
    this.nextButtonText = 'Next',
    required this.nextRoute,
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: 360,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 98),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: AppConstants.fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.textPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                textAlign: TextAlign.center,
                description,
                style: const TextStyle(color: AppConstants.textTertiary),
              ),
              const SizedBox(height: 57),
              Image.asset(
                dotsImagePath,
                width: 35,
                height: 7,
              ),
              const SizedBox(height: 59),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (showSkipButton)
                    SecondaryButton(
                      text: 'Skip',
                      onPressed: () {
                        Navigator.pushNamed(context, AppConstants.routeSignIn);
                      },
                      width: 160,
                    ),
                  PrimaryButton(
                    text: nextButtonText,
                    onPressed: () {
                      Navigator.pushNamed(context, nextRoute);
                    },
                    width: 160,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}