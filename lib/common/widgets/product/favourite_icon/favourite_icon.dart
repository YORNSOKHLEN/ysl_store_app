import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fast_food/features/shop/controllers/product/favourite_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../icons/circular_icon.dart';

class YFavouriteIcon extends StatelessWidget {
  const YFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());

    return Obx(
      () => YCircularIcon(
        icon: controller.isFavourite(productId)
            ? Iconsax.heart5
            : Iconsax.heart,
        color: controller.isFavourite(productId) ? YColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ), // TCircularIcon
    ); // Obx
  }
}
