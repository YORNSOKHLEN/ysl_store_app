import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    show SmoothPageIndicator, ExpandingDotsEffect;
import 'package:ysl_store_app/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = YHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: YDeviceUtils.getBottomNavigationBarHeight(context) + 24,
      left: YSizes.defaultSpace,

      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? YColors.light : YColors.dark,
          dotHeight: 6,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
