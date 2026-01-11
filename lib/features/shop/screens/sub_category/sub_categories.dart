import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/images/rounded_image.dart';
import 'package:ysl_store_app/common/widgets/product/product_cards/product_card_horizontal.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              YRoundedImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                imageUrl: YImage.promoIphone,
                applyImageRadius: true,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Sub-Categories
              Column(
                children: [
                  // Heading
                  YSectionHeading(title: 'Flagship Phones', onPressed: () {}),
                  const SizedBox(height: YSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => YProductCardHorizontal(),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: YSizes.spaceBtwItems),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
