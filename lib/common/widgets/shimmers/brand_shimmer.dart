import 'package:flutter/material.dart';
import 'package:fast_food/common/widgets/shimmers/shimmer.dart';

import '../layouts/grid_layout.dart';

class YBrandsShimmer extends StatelessWidget {
  const YBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return YGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const YShimmerEffect(width: 300, height: 80),
    ); // TGridLayout
  }
}
