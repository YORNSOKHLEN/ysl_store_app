import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../all_products/all_products.dart';

class RandomProductsTab extends StatelessWidget {
  const RandomProductsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              YSectionHeading(
                title: 'Random Products',
                onPressed: () => Get.to(
                  () => AllProductsScreen(
                    title: 'Random Products',
                    futureMethod: controller.fetchRandomProducts(limit: -1),
                  ),
                ),
              ),
              const SizedBox(height: YSizes.spaceBtwItems),
              FutureBuilder(
                future: controller.fetchRandomProducts(limit: 8),
                builder: (context, asyncSnapshot) {
                  final response = YCloudHelperFunctions.checkMultiRecordState(
                    snapshot: asyncSnapshot,
                    loader: const YVerticalProductShimmer(),
                  );

                  if (response != null) return response;

                  final products = asyncSnapshot.data!;
                  return YGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) =>
                        ProductCardVertical(product: products[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

