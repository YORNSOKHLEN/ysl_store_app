import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ysl_store_app/common/widgets/texts/product_title_text.dart';
import 'package:ysl_store_app/utils/constants/colors.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [YShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(YSizes.productImageRadius),
          color: dark ? YColors.darkerGrey : YColors.white,
        ),
        child: Column(
          children: [
            //  Thumbnail, Wishlist Button, Discount
            YRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(YSizes.sm),
              backgroundColor: dark ? YColors.darkerGrey : YColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image
                  YRoundedImage(
                    imageUrl: YImage.imageIphone17ProMaxOrange,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                    backgroundColor: dark ? YColors.darkerGrey : YColors.light,
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
                        '25%',
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
                    child: YCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: YSizes.spaceBtwSections / 2),

            // Detail
            Padding(
              padding: EdgeInsets.only(left: YSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YProductTitleText(
                    title: 'Iphone 17 ProMax Orange',
                    smallSize: true,
                  ),
                  const SizedBox(height: YSizes.spaceBtwSections / 2),
                  YBrandTitleWithVerifiedIcon(title: 'Apple'),
                ],
              ),
            ),
            Spacer(),
            // Row Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: const EdgeInsets.only(left: YSizes.sm),
                  child: YProductPriceText(price: '1100'),
                ),

                // Add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: YColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(YSizes.cardRadiusMd),
                      bottomRight: Radius.circular(YSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: YSizes.iconLg * 1.2,
                    height: YSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: YColors.white),
                    ),
                  ),
                ),
              ], // Row
            ),
          ],
        ),
      ),
    );
  }
}
