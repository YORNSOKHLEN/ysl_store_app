import 'package:flutter/material.dart';
import 'package:fast_food/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class YBoxesShimmer extends StatelessWidget {
  const YBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: YShimmerEffect(width: 150, height: 110)),
            SizedBox(width: YSizes.spaceBtwItems),
            Expanded(child: YShimmerEffect(width: 150, height: 110)),
            SizedBox(width: YSizes.spaceBtwItems),
            Expanded(child: YShimmerEffect(width: 150, height: 110)),
          ],
        ), // Row
      ],
    ); // Column
  }
}
