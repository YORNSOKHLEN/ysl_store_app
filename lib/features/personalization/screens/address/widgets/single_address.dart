import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YSingleAddress extends StatelessWidget {
  const YSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return YRoundedContainer(
      showBorder: true,
      width: double.infinity,
      padding: EdgeInsets.all(YSizes.md),
      backgroundColor: selectedAddress
          ? YColors.buttonPrimary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? YColors.darkerGrey
          : YColors.grey,
      margin: EdgeInsets.only(bottom: YSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                        ? YColors.light
                        : YColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sokh len',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: YSizes.sm / 2),
              Text('(+855) 96 280 7801'),
              const SizedBox(height: YSizes.sm / 2),
              Text(
                'House No. 123, Street 456, Sangkat Toul Tompoung II, Khan Chamkarmon, Phnom Penh, Cambodia',
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
