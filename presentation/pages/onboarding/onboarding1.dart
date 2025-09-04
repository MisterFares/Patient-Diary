import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/onboarding/base_boarding_screen.dart';

class OnBoarding1 extends BaseOnboardingScreen {
  const OnBoarding1({super.key})
      : super(
          imagePath: AppConstants.boarding1Path,
          title: 'Never miss an appointment !',
          description: 'App will let you know about all upcoming\nappointments on time.',
          dotsImagePath: 'assets/images/boarding1_dots.png',
          nextRoute: AppConstants.routeOnboarding2,
        );
}