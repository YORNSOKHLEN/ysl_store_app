import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class YUserProfileTile extends StatelessWidget {
  const YUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Obx(() {
      return ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage(YImage.userReview2),
          radius: 25,
        ),
        title: Text(
          controller.user.value.fullName,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: YColors.white),
        ),
        subtitle: Text(
          controller.user.value.email ?? '',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.apply(color: YColors.white),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.edit, color: YColors.white),
        ),
      );
    });
  }
}
