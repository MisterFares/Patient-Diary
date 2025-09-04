import 'package:project/core/constants/app_constants.dart';
import 'package:project/presentation/pages/onboarding/base_boarding_screen.dart';

class OnBoarding3 extends BaseOnboardingScreen {
  const OnBoarding3({super.key})
      : super(
          imagePath: AppConstants.boarding3Path,
          title: 'Keep patient records with you !',
          description: 'App has unique feature to create patient profile \nand keep all related documents.',
          dotsImagePath: AppConstants.boarding3DotsPath,
          nextRoute: AppConstants.routeSignIn,
        );
}