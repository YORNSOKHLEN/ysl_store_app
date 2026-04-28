import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/product/cart_controller.dart';
import '../../../models/cart_item_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    this.showAddRemoveButton = true,
    this.items,
  });

  final bool showAddRemoveButton;
  final List<CartItemModel>? items;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    Widget buildList(List<CartItemModel> sourceItems) {
      final canModify = showAddRemoveButton && items == null;
      return ListView.separated(
        shrinkWrap: true,
        itemCount: sourceItems.length,
        separatorBuilder: (_, _) =>
            const SizedBox(height: YSizes.spaceBtwSections),
        itemBuilder: (_, index) {
          final item = sourceItems[index];
          return Column(
            children: [
              // Cart Item
              YCartItem(cartItem: item),
              if (canModify) const SizedBox(height: YSizes.spaceBtwItems),

              // Add Remove Button
              if (canModify)
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
        },
      );
    }

    if (items != null) {
      return buildList(items!);
    }

    return Obx(() => buildList(cartController.cartItems));
  }
}
