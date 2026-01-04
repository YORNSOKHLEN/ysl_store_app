import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/images/rounded_image.dart';
import 'package:ysl_store_app/utils/constants/colors.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [YShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(YSizes.productImageRadius),
        color: dark ? YColors.darkerGrey : YColors.white,
      ),
      child: Column(
        children: [
          //  Thumbnail, Wishlist Button, Discount
          YRoundedContainer(
            height: 180,
            padding: EdgeInsets.all(YSizes.sm),
            backgroundColor: dark ? YColors.dark : YColors.light,
            child: Stack(
              children: [
                // Thumbnail Image
                const YRoundedImage(
                  imageUrl: YImage.imageIphone17ProMaxOrange,
                  applyImageRadius: true,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
