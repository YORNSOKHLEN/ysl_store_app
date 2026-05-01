import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fast_food/common/widgets/product/favourite_icon/favourite_icon.dart';
import 'package:fast_food/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:fast_food/common/widgets/texts/product_title_text.dart';
import 'package:fast_food/features/shop/models/product_model.dart';
import 'package:fast_food/utils/constants/colors.dart';
import 'package:fast_food/utils/constants/enums.dart';
import 'package:fast_food/utils/constants/sizes.dart';
import 'package:fast_food/utils/helpers/helper_functions.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/screens/cart/widgets/add_to_cart_button.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    final dark = YHelperFunctions.isDarkMode(context);
    final isOutOfStock = product.stock <= 0;

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [YShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(YSizes.productImageRadius),
          color: dark ? YColors.darkerGrey : YColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  Thumbnail, Wishlist Button, Discount
            YRoundedContainer(
              height: 160,
              padding: const EdgeInsets.all(YSizes.sm),
              backgroundColor: dark ? YColors.darkerGrey : YColors.light,
              child: Stack(
                children: [
                  // Thumbnail Image with opacity if out of stock
                  YRoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),

                  // Discount badge - only show if there's a sale
                  if (salePercentage != null)
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
                          '$salePercentage%',
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.apply(color: YColors.black),
                        ),
                      ),
                    ),

                  // Stock status badge
                  if (isOutOfStock)
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: YRoundedContainer(
                        radius: YSizes.sm,
                        backgroundColor: YColors.error.withOpacity(0.8),
                        padding: EdgeInsets.symmetric(
                          horizontal: YSizes.sm,
                          vertical: YSizes.xs,
                        ),
                        child: Text(
                          'Out of Stock',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.apply(color: YColors.white),
                        ),
                      ),
                    ),

                  // Favourite/Wishlist Button with GetX reactive state
                  Positioned(
                    top: 0,
                    right: 0,
                    child: YFavouriteIcon(productId: product.id),
                  ),
                ],
              ),
            ),
            const SizedBox(height: YSizes.spaceBtwSections / 2),

            // Detail
            Padding(
              padding: EdgeInsets.only(left: YSizes.sm, right: YSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: YSizes.spaceBtwSections / 2),
                  YBrandTitleWithVerifiedIcon(
                    title: product.brand?.name ?? 'Unknown',
                  ),
                ],
              ),
            ),
            Spacer(),
            // Row Price and Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price Section
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Original price with strikethrough if on sale
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: YSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                              decoration: TextDecoration.lineThrough,
                              color: YColors.darkGrey,
                            ),
                          ),
                        ),

                      // Current/Sale price
                      Padding(
                        padding: const EdgeInsets.only(left: YSizes.sm),
                        child: YProductPriceText(
                          price: controller.getProductPrice(product).toString(),
                        ),
                      ),
                    ],
                  ),
                ),

                // Add to cart button
                ProductCartAddToCart(product: product),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
