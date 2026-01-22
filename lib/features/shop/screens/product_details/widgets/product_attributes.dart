import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/common/widgets/chips/choice_chip.dart';
import 'package:ysl_store_app/common/widgets/texts/section_heading.dart';
import 'package:ysl_store_app/features/shop/models/product_model.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/product/variation_controller.dart';

class YProductAttributes extends StatelessWidget {
  const YProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Column(
      children: [
        Obx(() {
          final variation = controller.selectedVariation.value;
          if (variation.id.isNotEmpty) ;
          return YRoundedContainer(
            padding: const EdgeInsets.all(YSizes.md),
            backgroundColor: dark ? YColors.darkerGrey : YColors.softGrey,
            child: Column(
              children: [
                /// Title, Price and Stock
                Row(
                  children: [
                    const YSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    const SizedBox(width: YSizes.spaceBtwItems),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Price
                        Row(
                          children: [
                            const YProductTitleText(
                              title: 'Price : ',
                              smallSize: true,
                            ),

                            /// Actual Price
                            if (variation.salePrice > 0)
                              Text(
                                '\$${variation.price}',
                                style: Theme.of(context).textTheme.titleSmall!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2,
                                    ),
                              ),

                            const SizedBox(width: YSizes.spaceBtwItems),

                            /// Sale Price / Normal Price
                            YProductPriceText(
                              price:
                                  (variation.salePrice > 0
                                          ? variation.salePrice
                                          : variation.price)
                                      .toString(),
                            ),
                          ],
                        ),

                        /// Stock
                        Row(
                          children: [
                            const YProductTitleText(
                              title: 'Stock : ',
                              smallSize: true,
                            ),
                            Text(
                              variation.stock > 0 ? 'In Stock' : 'Out of Stock',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                /// Description
                // YProductTitleText(
                //   title: variation.description!,
                //   smallSize: true,
                //   maxLines: 4,
                // ),
              ],
            ),
          );
        }),

        SizedBox(height: YSizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YSectionHeading(
                      title: attribute.name ?? '',
                      showActionButton: false,
                    ),
                    SizedBox(height: YSizes.spaceBtwItems / 2),
                    Obx(() {
                      return Wrap(
                        spacing: 8,
                        children: attribute.values!.map((attributeValue) {
                          final isSelected =
                              controller.selectedAttributes[attribute.name] ==
                              attributeValue;
                          final available = controller
                              .getAttributesAvailabilityInVariation(
                                product.productVariations!,
                                attribute.name!,
                              )
                              .contains(attributeValue);
                          return YChoiceChip(
                            text: attributeValue,
                            selected: isSelected,
                            onSelected: available
                                ? (selected) {
                                    if (selected && available) {
                                      controller.onAttributeSelected(
                                        product,
                                        attribute.name ?? '',
                                        attributeValue,
                                      );
                                    }
                                  }
                                : null,
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
