import 'package:flutter/material.dart';
import 'package:fast_food/common/widgets/appbar/appbar.dart';
import 'package:fast_food/features/shop/screens/order/widgets/order_list.dart';
import 'package:fast_food/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: YAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(YSizes.defaultSpace),
        child:
            // Orders
            YOrderListItems(),
      ),
    );
  }
}
