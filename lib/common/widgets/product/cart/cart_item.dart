import 'package:flutter/material.dart';

import '../../../../features/shop/models/cart_item_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class YCartItem extends StatelessWidget {
  const YCartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        YRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(YSizes.xs),
          isNetworkImage: true,
          backgroundColor: dark ? YColors.darkerGrey : YColors.light,
        ),
        const SizedBox(width: YSizes.spaceBtwItems),

        // Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                child: YProductTitleText(title: cartItem.title, maxLines: 1),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  // Mapping variation entries (e.g., Color: Red) to TextSpans
                  children: (cartItem.selectedVariation ?? {}).entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                              text: ' ${e.key} ',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: '${e.value} ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
