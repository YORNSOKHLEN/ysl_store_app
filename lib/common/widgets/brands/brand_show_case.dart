import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import 'brand_card.dart';

class YBrandShowCase extends StatelessWidget {
  const YBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return YRoundedContainer(
      showBorder: true,
      borderColor: YColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(YSizes.md),
      margin: const EdgeInsets.only(bottom: YSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          const YBrandCard(showBorder: false),

          /// Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidgets(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidgets(String image, context) {
  return Expanded(
    child: YRoundedContainer(
      height: 180,
      backgroundColor: YHelperFunctions.isDarkMode(context)
          ? YColors.darkerGrey
          : YColors.light,
      margin: const EdgeInsets.only(right: YSizes.sm),
      padding: const EdgeInsets.all(YSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
