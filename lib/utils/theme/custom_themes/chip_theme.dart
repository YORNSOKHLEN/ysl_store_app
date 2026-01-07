import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class YChipTheme {
  YChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: YColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: YColors.black),
    selectedColor: YColors.buttonPrimary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: YColors.white,
  );
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: YColors.darkerGrey,
    labelStyle: const TextStyle(color: YColors.white),
    selectedColor: YColors.buttonPrimary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: YColors.white,
  );
}
