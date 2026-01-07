import 'package:flutter/material.dart';

import 'curved_edges.dart';

class YCurvedEdgesWidgets extends StatelessWidget {
  const YCurvedEdgesWidgets({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: YCustomCurvedEdges(), child: child);
  }
}
