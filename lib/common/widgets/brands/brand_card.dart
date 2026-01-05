import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';

class YBrandCard extends StatelessWidget {
  const YBrandCard({super.key, required this.showBorder, this.onTab});

  final bool showBorder;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTab,
      child: YRoundedContainer(
        padding: const EdgeInsets.all(YSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: YCircularImage(
                image: YImage.pinIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? YColors.white : YColors.black,
              ),
            ),
            const SizedBox(width: YSizes.spaceBtwItems / 2),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YBrandTitleWithVerifiedIcon(
                    title: 'Apple',
                    brandTextSize: TextSize.large,
                  ),
                  Text(
                    '100 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium!.copyWith(color: YColors.darkGrey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
