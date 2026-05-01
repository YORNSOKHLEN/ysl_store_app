import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fast_food/common/widgets/appbar/appbar.dart';
import 'package:fast_food/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:fast_food/features/shop/screens/store/widgets/random_products_tab.dart';

import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(
        title: Text('Food', style: Theme.of(context).textTheme.headlineMedium),
        action: [YCartCounterIcon(onPressed: () => Get.to(() => CartScreen()))],
      ),
      body: const RandomProductsTab(),
    );
  }
}
