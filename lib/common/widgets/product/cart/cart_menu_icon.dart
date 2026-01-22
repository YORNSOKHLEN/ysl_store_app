import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class YCartCounterIcon extends StatelessWidget {
  const YCartCounterIcon({
    super.key,
    this.iconColor,
    required this.onPressed,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = YHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: iconColor),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? YColors.white : YColors.dark),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(() {
                return Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge!
                      .apply(
                    color:
                    counterTextColor ??
                        (dark ? YColors.black : YColors.white),
                    fontSizeFactor: 1,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
