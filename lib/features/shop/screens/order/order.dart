import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/features/shop/screens/order/widgets/order_list.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

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
