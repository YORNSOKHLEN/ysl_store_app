import 'package:flutter/material.dart';
import 'package:ysl_store_app/utils/constants/colors.dart';

class YShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: YColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: YColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
