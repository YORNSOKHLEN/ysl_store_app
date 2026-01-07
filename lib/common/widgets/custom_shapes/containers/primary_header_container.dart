import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widgets.dart';
import 'circular_container.dart';

class YPrimaryHeaderContainer extends StatelessWidget {
  const YPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return YCurvedEdgesWidgets(
      child: Container(
        color: YColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: YCircularContainer(
                backgroundColor: YColors.light.withAlpha(51),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: YCircularContainer(
                backgroundColor: YColors.light.withAlpha(51),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
