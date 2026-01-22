import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(() {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) =>
            const SizedBox(height: YSizes.spaceBtwSections),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];
          return Column(
            children: [
              // Cart Item
              YCartItem(cartItem: item),
              if (showAddRemoveButton)
                const SizedBox(height: YSizes.spaceBtwItems),

              // Add Remove Button
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //  Extra space
                        const SizedBox(width: 40),
                        YProductQuantityWithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),

                    // Product total price
                    YProductPriceText(
                      price: (item.price * item.quantity).toStringAsFixed(1),
                    ),
                  ],
                ),
            ],
          );
        }),
      );
    });
  }
}
