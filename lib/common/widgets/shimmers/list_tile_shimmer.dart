import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class YListTileShimmer extends StatelessWidget {
  const YListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            YShimmerEffect(width: 50, height: 50, radius: 50),
            const SizedBox(width: YSizes.spaceBtwItems),
            const Column(
              children: [
                YShimmerEffect(width: 100, height: 15),
                SizedBox(height: YSizes.spaceBtwItems / 2),
                YShimmerEffect(width: 80, height: 12),
              ],
            ), // Column
          ],
        ), // Row
      ],
    ); // Column
  }
}
