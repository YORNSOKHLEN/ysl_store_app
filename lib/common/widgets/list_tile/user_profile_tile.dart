import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
import '../shimmers/shimmer.dart';

class YUserProfileTile extends StatelessWidget {
  const YUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(() {
      final networkImage = controller.user.value.profilePicture ?? '';
      final image = networkImage.isNotEmpty ? networkImage : YImage.user;

      return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          child: controller.imageUpLoading.value
              ? const YShimmerEffect(width: 50, height: 50, radius: 50)
              : YCircularImage(
                  image: image,
                  width: 50,
                  height: 50,
                  isNetworkImage: networkImage.isNotEmpty,
                ),
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
          icon: const Icon(Iconsax.edit, color: YColors.white),
        ),
      );
    });
  }
}
