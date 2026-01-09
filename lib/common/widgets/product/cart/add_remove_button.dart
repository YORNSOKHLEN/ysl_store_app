import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class YProductQuantityWithAddRemoveButton extends StatelessWidget {
  const YProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        const SizedBox(width: 70),

        /// Add Remove Buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            YCircularIcon(
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: YSizes.md,
              color: dark ? YColors.white : YColors.black,
              backgroundColor: dark ? YColors.darkerGrey : YColors.light,
            ), // TCircularIcon
            const SizedBox(width: YSizes.spaceBtwItems),
            Text('2', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(width: YSizes.spaceBtwItems),

            const YCircularIcon(
              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: YSizes.md,
              color: YColors.white,
              backgroundColor: YColors.buttonPrimary,
            ), // TCircularIcon
          ],
        ),
      ],
    );
  }
}
