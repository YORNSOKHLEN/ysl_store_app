import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class YSearchContainer extends StatelessWidget {
  const YSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: YSizes.defaultSpace),
      child: Container(
        width: YDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(YSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                    ? YColors.dark
                    : YColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(YSizes.borderRadiusLg),
          border: showBorder ? Border.all(color: YColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: YColors.grey),
            SizedBox(width: YSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.apply(color: YColors.darkerGrey),
            ),
          ],
        ),
      ),
    );
  }
}
