import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/order_controller.dart';
import '../../../models/order_model.dart';

class YOrderListItems extends StatelessWidget {
  const YOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = YHelperFunctions.isDarkMode(context);

    return FutureBuilder<List<OrderModel>>(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        /// Empty State
        final emptyWidget = YAnimationLoaderWidget(
          text: 'Whoops! No Orders Yet!',
          animation: YImage.paymentSuccess,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        final response = YCloudHelperFunctions.checkMultiRecordState(
          snapshot: snapshot,
          nothingFound: emptyWidget,
        );
        if (response != null) return response;

        final orders = snapshot.data!;

        return ListView.separated(
          itemCount: orders.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: YSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];

            return YRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(YSizes.md),
              backgroundColor: dark ? YColors.dark : YColors.light,
              child: Column(
                children: [
                  /// Row 1
                  Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(width: YSizes.spaceBtwItems / 2),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .apply(
                                    color: YColors.buttonPrimary,
                                    fontWeightDelta: 1,
                                  ),
                            ),
                            Text(
                              YHelperFunctions.getFormattedDate(
                                order.orderDate,
                              ),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_34,
                          size: YSizes.iconSm,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: YSizes.spaceBtwItems),

                  /// Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(width: YSizes.spaceBtwItems / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order ID',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  order.id,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: YSizes.spaceBtwItems / 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Payment',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  order.paymentMethod,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
