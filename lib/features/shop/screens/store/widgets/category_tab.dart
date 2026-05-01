import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fast_food/features/shop/models/category_model.dart';
import 'package:fast_food/features/shop/screens/store/widgets/category_brands.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmers/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/category_controller.dart';
import '../../all_products/all_products.dart';

class YCategoryTab extends StatelessWidget {
  const YCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              CategoryBrands(category: category),
              const SizedBox(height: YSizes.spaceBtwItems),

              /// -- Product
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, asyncSnapshot) {
                  /// Helper Function: Handle Loader, No Record, OR ERROR Message
                  final response = YCloudHelperFunctions.checkMultiRecordState(
                    snapshot: asyncSnapshot,
                    loader: const YVerticalProductShimmer(),
                  );
                  if (response != null) return response;

                  /// Record Found!
                  final products = asyncSnapshot.data!;
                  return Column(
                    children: [
                      YSectionHeading(
                        title: 'You might like',
                        onPressed: () => Get.to(
                          () => AllProductsScreen(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                              categoryId: category.id,
                              limit: -1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: YSizes.spaceBtwItems),

                      YGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) =>
                            ProductCardVertical(product: products[index]),
                      ),
                    ],
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
