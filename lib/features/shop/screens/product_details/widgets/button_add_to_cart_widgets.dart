import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/common/widgets/icons/circular_icon.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YButtonAddToCartWidgets extends StatelessWidget {
  const YButtonAddToCartWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: YSizes.defaultSpace,
        vertical: YSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: dark ? YColors.darkerGrey : YColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(YSizes.cardRadiusLg),
          topRight: Radius.circular(YSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              YCircularIcon(
                icon: Iconsax.minus,
                width: 40,
                height: 40,
                backgroundColor: YColors.darkGrey,
                color: YColors.white,
              ),
              const SizedBox(width: YSizes.spaceBtwItems),
              Text('3', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: YSizes.spaceBtwItems),
              YCircularIcon(
                icon: Iconsax.add,
                width: 40,
                height: 40,
                backgroundColor: YColors.black,
                color: YColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(YSizes.md),
              backgroundColor: YColors.black,
              side: BorderSide(color: YColors.black),
            ),
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
