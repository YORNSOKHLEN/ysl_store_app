import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';
import 'package:ysl_store_app/features/shop/models/product_model.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/button_add_to_cart_widgets.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/ratting_share_widgets.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../checkout/checkout.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: YButtonAddToCartWidgets(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            YProductImageSlider(product: product),

            // Product Details
            Padding(
              padding: EdgeInsets.only(
                right: YSizes.defaultSpace,
                left: YSizes.defaultSpace,
                bottom: YSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Ratting & Share Button
                  YRattingAndShare(product: product),

                  // Price Title Stock Brand
                  YProductMetaData(product: product),

                  // Attributes
                  // Better: Grouped with a spread operator
                  // if (product.productType == ProductType.variable.toString())
                  //   YProductAttributes(product: product),
                  // if (product.productType == ProductType.variable.toString())
                  //   const SizedBox(height: YSizes.spaceBtwSections),

                  // Check out
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => CheckoutScreen()),
                      child: Text('Check out'),
                    ),
                  ),
                  SizedBox(height: YSizes.spaceBtwSections),

                  // Description
                  YSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(height: YSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? 'No description available',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // Review
                  const Divider(),
                  SizedBox(height: YSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      YSectionHeading(
                        title: 'Review (33)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: Icon(Iconsax.arrow_right_3),
                      ),
                    ],
                  ),
                  SizedBox(height: YSizes.spaceBtwSections),
                  // Review Card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
