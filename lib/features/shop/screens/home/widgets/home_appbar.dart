import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/product/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/popups/shimmer.dart';
import '../../cart/cart.dart';

class YHomeAppBar extends StatelessWidget {
  const YHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return YAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            YText.homeAppBarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.apply(color: YColors.lightGrey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer effect while loading user profile is being loaded
              return const YShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: YColors.white),
              );
            }
          }),
        ],
      ),
      action: [
        YCartCounterIcon(
          onPressed: () => Get.to(() => CartScreen()),
          iconColor: YColors.white,
        ),
      ],
    );
  }
}
