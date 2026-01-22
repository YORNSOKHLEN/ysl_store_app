import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/shop/controllers/product/cart_controller.dart';
import 'package:ysl_store_app/features/shop/screens/cart/widgets/cart_item.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: YAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),

      // Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(YSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => CheckoutScreen()),
                child: Obx(() {
                  return Text('Checkout \$${controller.totalCartPrice.value}');
                }),
              ),
            ),
      body: Obx(() {
        /// Nothing Found Widget
        final emptyWidget = YAnimationLoaderWidget(
          text: 'Whoops! Cart is EMPTY.',
          animation: YImage.docerAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(YSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Items in Cart
                  CartItem(),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
