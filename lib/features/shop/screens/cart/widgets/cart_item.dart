import 'package:flutter/material.dart';

import '../../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, this.showAddRemoveButton = true});

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) =>
          const SizedBox(height: YSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Item
          YCartItem(),
          if (showAddRemoveButton) const SizedBox(height: YSizes.spaceBtwItems),

          // Add Remove Button
          if (showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //  Extra space
                    const SizedBox(width: 40),
                    YProductQuantityWithAddRemoveButton(),
                  ],
                ),

                // Product total price
                YProductPriceText(price: '1100'),
              ],
            ),
        ],
      ),
    );
  }
}
