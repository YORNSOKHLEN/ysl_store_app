import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ysl_store_app/features/shop/screens/store/widgets/random_products_tab.dart';

import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(
        title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
        action: [YCartCounterIcon(onPressed: () => Get.to(() => CartScreen()))],
      ),
      body: const RandomProductsTab(),
    );
  }
}
