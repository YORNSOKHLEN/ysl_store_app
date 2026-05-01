import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fast_food/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:fast_food/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:fast_food/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:fast_food/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:fast_food/utils/constants/image_strings.dart';
import 'package:fast_food/utils/constants/text_strings.dart';

import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Page View
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: YImage.onBoardingImage1,
                title: YText.onBoardingTitle1,
                subtitle: YText.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: YImage.onBoardingImage2,
                title: YText.onBoardingTitle2,
                subtitle: YText.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: YImage.onBoardingImage3,
                title: YText.onBoardingTitle3,
                subtitle: YText.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation
          const OnBoardingNavigation(),

          /// Circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
