import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key,});


  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? YColors.darkGrey : YColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: YSizes.iconMd,
              height: YSizes.iconMd,
              image: AssetImage(YImage.googleLogo),
            ),
          ),
        ),
        const SizedBox(width: YSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: dark ? YColors.darkGrey : YColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: YSizes.iconMd,
              height: YSizes.iconMd,
              image: AssetImage(YImage.facebookLogo),
            ),
          ),
        ),
      ],
    );
  }
}
