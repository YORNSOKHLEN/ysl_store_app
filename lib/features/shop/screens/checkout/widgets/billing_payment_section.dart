import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/checkout_controller.dart';

class YBillingPaymentSection extends StatelessWidget {
  const YBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    final dark = YHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        YSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {
            controller.selectPaymentMethod(context);
          },
        ),
        const SizedBox(height: YSizes.spaceBtwItems / 2),
        Obx(() {
          return Row(
            children: [
              YRoundedContainer(
                width: 70,
                height: 70,
                backgroundColor: dark ? YColors.light : YColors.white,
                padding: const EdgeInsets.all(YSizes.sm),
                child: Image(
                  image: AssetImage(
                    controller.selectedPaymentMethod.value.image,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: YSizes.spaceBtwItems / 2),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          );
        }),
      ],
    );
  }
}
