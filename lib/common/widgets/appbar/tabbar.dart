import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class YTabBar extends StatelessWidget implements PreferredSizeWidget {
  const YTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? YColors.black : YColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: YColors.buttonPrimary,
        labelColor: dark ? YColors.white : YColors.buttonPrimary,
        unselectedLabelColor: YColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(YDeviceUtils.getAppBarHeight());
}
