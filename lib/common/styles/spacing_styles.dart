import 'package:flutter/widgets.dart';

import '../../utils/constants/sizes.dart';

class YSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: YSizes.appBarHeight,
    left: YSizes.defaultSpace,
    bottom: YSizes.defaultSpace,
    right: YSizes.defaultSpace,
  );
}
