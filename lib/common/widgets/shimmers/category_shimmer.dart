import 'package:flutter/material.dart';
import 'package:fast_food/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class YCategoryShimmer extends StatelessWidget {
  const YCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: YSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              YShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: YSizes.spaceBtwItems / 2),

              /// Text
              YShimmerEffect(width: 55, height: 8),
            ],
          ); // Column
        },
      ),
    );
  }
}
