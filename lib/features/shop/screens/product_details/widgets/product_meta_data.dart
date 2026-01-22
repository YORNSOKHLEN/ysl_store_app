import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ysl_store_app/common/widgets/images/circular_image.dart';
import 'package:ysl_store_app/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ysl_store_app/features/shop/controllers/product/product_controller.dart';
import 'package:ysl_store_app/features/shop/models/product_model.dart';
import 'package:ysl_store_app/utils/constants/colors.dart';
import 'package:ysl_store_app/utils/constants/enums.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YProductMetaData extends StatelessWidget {
  const YProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
      product.price,
      product.salePrice,
    );
    final finalPrice = controller.getFinalPrice(product);
    final stockStatus = controller.getProductStockStatus(product.stock);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & sale Price
        Row(
          children: [
            // Sale Tag
            if (salePercentage != null)
              YRoundedContainer(
                radius: YSizes.sm,
                backgroundColor: YColors.secondary.withOpacity(0.8),
                padding: EdgeInsets.symmetric(
                  horizontal: YSizes.sm,
                  vertical: YSizes.xs,
                ),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: YColors.black),
                ),
              ),
            if (salePercentage != null)
              const SizedBox(width: YSizes.spaceBtwItems),

            /// Price
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
              ),
            ),
            if (product.salePrice > 0)
              const SizedBox(width: YSizes.spaceBtwItems),
            YProductPriceText(price: finalPrice, isLarge: true),
          ],
        ),
        const SizedBox(height: YSizes.spaceBtwItems / 1.5),

        /// Title
        YProductTitleText(title: product.title),
        const SizedBox(height: YSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const YProductTitleText(title: 'Status'),
            const SizedBox(width: YSizes.spaceBtwItems),
            Text(stockStatus, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: YSizes.spaceBtwItems / 2),

        /// Brand
        if (product.brand != null)
          Row(
            children: [
              YCircularImage(
                image: product.brand != null ? product.brand!.image : '',
                height: 32,
                overlayColor: dark ? YColors.white : YColors.black,
                isNetworkImage: product.brand!.image.startsWith('http'),
              ),
              const SizedBox(width: YSizes.spaceBtwItems / 6),
              YBrandTitleWithVerifiedIcon(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSize.medium,
              ),
            ],
          ),
      ],
    );
  }
}
