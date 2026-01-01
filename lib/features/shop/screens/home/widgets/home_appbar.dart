import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class YHomeAppBar extends StatelessWidget {
  const YHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return YAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            YText.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.apply(color: YColors.softGrey),
          ),
          Text(
            YText.homeAppBarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: YColors.light),
          ),
        ],
      ),
      action: [YCartCounterIcon(onPressed: () {}, iconColor: YColors.light)],
    );
  }
}
