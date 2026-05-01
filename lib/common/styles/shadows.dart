import 'package:flutter/material.dart';
import 'package:fast_food/utils/constants/colors.dart';

class YShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: YColors.darkGrey.withAlpha(26),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: YColors.darkGrey.withAlpha(26),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
