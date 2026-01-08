import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/button_add_to_cart_widgets.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ysl_store_app/features/shop/screens/product_details/widgets/ratting_share_widgets.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: YButtonAddToCartWidgets(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            YProductImageSlider(),

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
                  YRattingAndShare(),

                  // Price Title Stock Brand
                  YProductMetaData(),

                  // Attributes
                  YProductAttributes(),
                  SizedBox(height: YSizes.spaceBtwSections),

                  // Check out
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
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
                    "iPhone 17 Pro Max. The most powerful iPhone ever. Brilliant 6.9-inch display, aluminium unibody design, A19 Pro chip, all 48MP rear cameras and best-ever battery life. With all 48MP rear cameras and 8x optical-quality zoom the widest zoom range ever in an iPhone. It's the equivalent of 8 pro lenses in your pocket. A19 Pro is the most powerful iPhone chip yet, delivering up to 40% better sustained performance. The unibody design creates massive additional battery capacity, for up to 37 hours of video playback. Charge up to 50% in 20 minutes. Heat-forged aluminium unibody design for the most powerful iPhone ever made. Ceramic Shield protects the back of iPhone 17 Pro Max, making it 4x more resistant to cracks. And the new Ceramic Shield 2 on the front has 3x better scratch resistance. iPhone with iOS 26, USB-C Charge Cable (1m).",
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
