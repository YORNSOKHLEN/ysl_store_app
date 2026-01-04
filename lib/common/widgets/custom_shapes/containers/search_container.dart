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
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: YSizes.defaultSpace),
        child: Container(
          width: YDeviceUtils.getScreenWidth(context),
          padding: EdgeInsets.all(YSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                      ? YColors.light
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
      ),
    );
  }
}
