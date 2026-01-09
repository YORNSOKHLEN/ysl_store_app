import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YBillingPaymentSection extends StatelessWidget {
  const YBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        YSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: YSizes.spaceBtwItems / 2),
        Row(
          children: [
            YRoundedContainer(
              width: 70,
              height: 70,
              backgroundColor: dark ? YColors.light : YColors.white,
              padding: const EdgeInsets.all(YSizes.sm),
              child: const Image(
                image: AssetImage(YImage.aba),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: YSizes.spaceBtwItems / 2),
            Text('ABA Bank', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
