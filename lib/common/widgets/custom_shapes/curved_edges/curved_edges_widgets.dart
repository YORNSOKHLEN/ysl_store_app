import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../containers/circular_container.dart';
import 'curved_edges.dart';

class YCurvedEdgesWidgets extends StatelessWidget {
  const YCurvedEdgesWidgets({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: YCustomCurvedEdges(),
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
