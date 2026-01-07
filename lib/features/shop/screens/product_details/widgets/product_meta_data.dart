import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ysl_store_app/common/widgets/images/circular_image.dart';
import 'package:ysl_store_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ysl_store_app/utils/constants/colors.dart';
import 'package:ysl_store_app/utils/constants/enums.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YProductMetaData extends StatelessWidget {
  const YProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & sale Price
        Row(
          children: [
            // Sale Tag
            YRoundedContainer(
              radius: YSizes.sm,
              backgroundColor: YColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                horizontal: YSizes.sm,
                vertical: YSizes.xs,
              ),
              child: Text(
                '10%',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: YColors.black),
              ),
            ),
            const SizedBox(width: YSizes.spaceBtwItems),

            /// Price
            Text(
              '\$1100',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
              ),
            ),
            const SizedBox(width: YSizes.spaceBtwItems),
            const YProductPriceText(price: '990', isLarge: true),
          ],
        ),
        const SizedBox(height: YSizes.spaceBtwItems / 1.5),

        /// Title
        const YProductTitleText(title: 'Iphone 17 ProMax Orange'),
        const SizedBox(height: YSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const YProductTitleText(title: 'Status'),
            const SizedBox(width: YSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: YSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            YCircularImage(
              image: YImage.brandIphone,
              width: 32,
              height: 32,
              overlayColor: dark ? YColors.white : YColors.black,
            ),
            YBrandTitleWithVerifiedIcon(
              title: 'Apple',
              brandTextSize: TextSize.medium,
            ),
          ],
        ),
      ],
    );
  }
}
