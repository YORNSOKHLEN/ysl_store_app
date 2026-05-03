import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:fast_food/common/widgets/appbar/appbar.dart';
import 'package:fast_food/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:fast_food/utils/constants/colors.dart';
import 'package:fast_food/utils/constants/sizes.dart';
import 'package:fast_food/utils/helpers/helper_functions.dart';
import 'package:fast_food/features/shop/screens/product_details/product_detail.dart';
import 'package:fast_food/data/repositories/product/product_repository.dart';
import 'package:fast_food/utils/popups/loaders.dart';
import '../../models/order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});

  final OrderModel order;

  String _price(double value) => '\$${value.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: YAppBar(
        showBackArrow: true,
        title: Text(
          'Order Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(YSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YRoundedContainer(
              showBorder: true,
              backgroundColor: dark ? YColors.dark : YColors.light,
              padding: const EdgeInsets.all(YSizes.md),
              child: Column(
                children: [
                  _DetailRow(label: 'Status', value: order.orderStatusText),
                  _DetailRow(
                    label: 'Order Date',
                    value: YHelperFunctions.getFormatDate(
                      order.orderDate,
                      format: 'dd MMM yyyy, hh:mm a',
                    ),
                  ),
                  _DetailRow(label: 'Payment', value: order.paymentMethod),
                  _DetailRow(label: 'Order ID', value: order.id),
                  _DetailRow(label: 'Total', value: _price(order.totalAmount), isLast: true),
                ],
              ),
            ),
            const SizedBox(height: YSizes.spaceBtwSections),
            Text('Items', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: YSizes.spaceBtwItems),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: YSizes.spaceBtwItems),
              itemBuilder: (_, index) {
                final item = order.items[index];
                final lineTotal = item.price * item.quantity;
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(YSizes.cardRadiusLg),
                    onTap: () async {
                      try {
                        Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
                        final repo = Get.put(ProductRepository());
                        final product = await repo.getProductById(item.productId);
                        Get.back();
                        Get.to(() => ProductDetailScreen(product: product));
                      } catch (e) {
                        Get.back();
                        YLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Product details not available');
                      }
                    },
                    child: YRoundedContainer(
                      showBorder: true,
                      backgroundColor: dark ? YColors.dark : YColors.light,
                      padding: const EdgeInsets.all(YSizes.md),
                      child: Row(
                        children: [
                          const Icon(Iconsax.bag_2, size: 18),
                          const SizedBox(width: YSizes.spaceBtwItems / 2),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  'Qty: ${item.quantity}',
                                  style: Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            _price(lineTotal),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value, this.isLast = false});

  final String label;
  final String value;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : YSizes.spaceBtwItems / 1.5),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: Theme.of(context).textTheme.labelMedium),
          ),
          const SizedBox(width: YSizes.sm),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}


