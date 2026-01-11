import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/common/widgets/texts/product_price_text.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class YProductCardHorizontal extends StatelessWidget {
  const YProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(YSizes.productImageRadius),
        color: dark ? YColors.darkerGrey : YColors.softGrey,
      ),
      child: Row(
        children: [
          // Thumbnail
          YRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(YSizes.sm),
            backgroundColor: dark ? YColors.dark : YColors.light,
            child: Stack(
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: YRoundedImage(
                    imageUrl: YImage.imageIphone17ProMaxOrange,
                    applyImageRadius: true, // IMPORTANT
                    fit: BoxFit.cover,
                  ),
                ),

                // Size tag
                Positioned(
                  top: 12,
                  child: YRoundedContainer(
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
                ),

                // Favourite Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: YCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                ),
              ],
            ),
          ),

          // Detail
          SizedBox(
            width: 172,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: YSizes.sm, left: YSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        YProductTitleText(
                          title: 'Iphone 17 ProMax Orange',
                          smallSize: true,
                        ),
                        const SizedBox(height: YSizes.spaceBtwItems / 2),
                        YBrandTitleWithVerifiedIcon(title: 'Apple'),

                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Pricing
                            Flexible(child: YProductPriceText(price: '1100.0')),

                            // Add to cart
                            Container(
                              decoration: const BoxDecoration(
                                color: YColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(YSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                    YSizes.productImageRadius,
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                width: YSizes.iconLg * 1.2,
                                height: YSizes.iconLg * 1.2,
                                child: Center(
                                  child: Icon(
                                    Iconsax.add,
                                    color: YColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
