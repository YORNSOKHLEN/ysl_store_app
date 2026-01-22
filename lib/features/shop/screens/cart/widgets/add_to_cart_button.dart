import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ysl_store_app/features/shop/models/product_model.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/product_detail.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductCartAddToCart extends StatelessWidget {
  const ProductCartAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(YSizes.cardRadiusMd),
        bottomRight: Radius.circular(YSizes.productImageRadius),
      ),
      onTap: () {
        Get.to(() => ProductDetailScreen(product: product));
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(
          product.id,
        );

        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0
                ? YColors.buttonPrimary
                : YColors.dark,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(YSizes.cardRadiusMd),
              bottomRight: Radius.circular(YSizes.productImageRadius),
            ),
          ),
          width: YSizes.iconLg * 1.2,
          height: YSizes.iconLg * 1.2,
          alignment: Alignment.center,
          child: productQuantityInCart > 0
              ? Text(
                  productQuantityInCart.toString(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.apply(color: YColors.white),
                )
              : const Icon(Iconsax.add, color: YColors.white),
        );
      }),
    );
  }
}
