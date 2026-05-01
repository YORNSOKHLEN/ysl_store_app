import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fast_food/common/widgets/icons/circular_icon.dart';
import 'package:fast_food/features/shop/controllers/product/cart_controller.dart';
import 'package:fast_food/features/shop/models/product_model.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YButtonAddToCartWidgets extends StatelessWidget {
  const YButtonAddToCartWidgets({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
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
          Obx(() {
            return Row(
              children: [
                YCircularIcon(
                  icon: Iconsax.minus,
                  width: 40,
                  height: 40,
                  backgroundColor: YColors.darkGrey,
                  color: YColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: YSizes.spaceBtwItems),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(width: YSizes.spaceBtwItems),
                YCircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  backgroundColor: YColors.black,
                  color: YColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            );
          }),
          ElevatedButton(
            onPressed: () => controller.addToCart(product),
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
