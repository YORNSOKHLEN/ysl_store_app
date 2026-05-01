import 'package:flutter/material.dart';
import 'package:fast_food/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class YHorizontalProductShimmer extends StatelessWidget {
  const YHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: YSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: YSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            YShimmerEffect(width: 120, height: 120),
            SizedBox(width: YSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: YSizes.spaceBtwItems / 2),
                YShimmerEffect(width: 160, height: 15),
                SizedBox(height: YSizes.spaceBtwItems / 2),
                YShimmerEffect(width: 110, height: 15),
                SizedBox(height: YSizes.spaceBtwItems / 2),
                YShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
