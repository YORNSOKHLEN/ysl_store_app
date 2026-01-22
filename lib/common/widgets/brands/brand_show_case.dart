import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/screens/brands/brand_products.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmers/shimmer.dart';
import 'brand_card.dart';

class YBrandShowCase extends StatelessWidget {
  const YBrandShowCase({super.key, required this.images, required this.brand});

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: YRoundedContainer(
        showBorder: true,
        borderColor: YColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(YSizes.md),
        margin: const EdgeInsets.only(bottom: YSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Products Count
            YBrandCard(showBorder: false, brand: brand),

            /// Brand Top 3 Product Images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidgets(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget brandTopProductImageWidgets(String image, context) {
  return Expanded(
    child: YRoundedContainer(
      height: 100,
      backgroundColor: YHelperFunctions.isDarkMode(context)
          ? YColors.darkerGrey
          : YColors.light,
      margin: const EdgeInsets.only(right: YSizes.xs),
      padding: const EdgeInsets.all(YSizes.xs),
      child: CachedNetworkImage(
        fit: BoxFit.contain,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const YShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ), // CachedNetworkImage
    ),
  );
}
