import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widgets.dart';
import 'circular_container.dart';

class YPrimaryHeaderContainer extends StatelessWidget {
  const YPrimaryHeaderContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return YCurvedEdgesWidgets(
      child: Container(
        color: YColors.primary,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: YCircularContainer(
                  backgroundColor: YColors.light.withOpacity(0.2),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: YCircularContainer(
                  backgroundColor: YColors.light.withOpacity(0.2),
                ),
              ),
              if (child != null) child!,
            ],
          ),
        ),
      ),
    );
  }
}
