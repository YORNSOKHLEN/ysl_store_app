import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';
import '../../models/category_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;

    return Scaffold(
      appBar: YAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              YRoundedImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                imageUrl: YImage.banner1,
                applyImageRadius: true,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),

              Obx(() {
                return YGridLayout(
                  itemCount: controller.featuredProducts.length,
                  itemBuilder: (_, index) => ProductCardVertical(
                    product: controller.featuredProducts[index],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
