// lib/presentation/pages/onboarding/on_boarding2.dart
import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/onboarding/base_boarding_screen.dart';

class OnBoarding2 extends BaseOnboardingScreen {
  const OnBoarding2({super.key})
      : super(
          imagePath: AppConstants.boarding2Path,
          title: 'Instantly schedule appointments',
          description: 'Quickly schedule appointments with easy user \ninterface.',
          dotsImagePath: AppConstants.boarding2DotsPath,
          nextRoute: AppConstants.routeOnboarding3,
        );
}
