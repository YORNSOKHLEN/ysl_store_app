import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/layouts/grip_layout.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class YCategoryTab extends StatelessWidget {
  const YCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const YBrandShowCase(
                images: [
                  YImage.imageIphone17ProMaxOrange,
                  YImage.imageIphone17ProMaxWhite,
                  YImage.imageIphone17ProMaxBlack,
                ],
              ),
              const YBrandShowCase(
                images: [
                  YImage.imageIphone17ProMaxOrange,
                  YImage.imageIphone17ProMaxWhite,
                  YImage.imageIphone17ProMaxBlack,
                ],
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              /// -- Product
              YSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              YGripLayout(
                itemCount: 4,
                itemBuilder: (_, index) => ProductCardVertical(),
              ),
              const SizedBox(height: YSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
