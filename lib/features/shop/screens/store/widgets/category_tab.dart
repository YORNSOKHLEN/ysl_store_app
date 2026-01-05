import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class YCategoryTab extends StatelessWidget {
  const YCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(YSizes.defaultSpace),
      child: Column(
        children: [
          /// -- Brands
          const YBrandShowCase(
            images: [
              YImage.imageIphone17ProMaxOrange,
              YImage.imageIphone17ProMaxWhite,
              YImage.imageIphone17Air,
            ],
          ),

          /// -- Product
          YSectionHeading(
            title: 'You might like',
            showActionButton: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
