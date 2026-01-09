import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/shop/screens/cart/widgets/cart_item.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(YSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Text('Checkout \$1100.0'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(YSizes.defaultSpace),

        // Item in cart
        child: CartItem(),
      ),
    );
  }
}
