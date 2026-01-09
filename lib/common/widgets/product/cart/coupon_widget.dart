import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class YCouponCode extends StatelessWidget {
  const YCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return YRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? YColors.dark : YColors.white,
      padding: const EdgeInsets.only(
        top: YSizes.sm,
        bottom: YSizes.sm,
        right: YSizes.sm,
        left: YSizes.md,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark
                    ? YColors.white.withOpacity(0.5)
                    : YColors.dark.withOpacity(0.5),
                backgroundColor: YColors.grey.withOpacity(0.2),
                side: BorderSide(color: YColors.grey.withOpacity(0.1)),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
