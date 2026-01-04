import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/product/product_cards/product_card_vertical.dart';
import 'package:ysl_store_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ysl_store_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ysl_store_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            YPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  YHomeAppBar(),
                  SizedBox(height: YSizes.spaceBtwSections),

                  //Searchbar
                  YSearchContainer(text: 'Search in Store'),
                  SizedBox(height: YSizes.spaceBtwSections),

                  // Categories and Heading
                  Padding(
                    padding: EdgeInsets.only(left: YSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        YSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: YSizes.spaceBtwItems),

                        // Categories
                        YHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(YSizes.spaceBtwItems),
              child: Column(
                children: [
                  // Promo Slider
                  YPromoSlider(
                    banners: [
                      YImage.promoIphone,
                      YImage.promoSamsung,
                      YImage.promoRedmiTurbo,
                    ],
                  ),
                  SizedBox(height: YSizes.spaceBtwSections),

                  // Popular Product
                  const ProductCardVertical(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
