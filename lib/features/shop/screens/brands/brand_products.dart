import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/common/widgets/brands/brand_card.dart';
import 'package:ysl_store_app/common/widgets/product/sortable/sortable_products.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(title: Text('Apple'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              YBrandCard(showBorder: true),
              SizedBox(height: YSizes.spaceBtwSections),

              /// Products
              YSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
