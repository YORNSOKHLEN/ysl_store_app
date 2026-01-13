import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ysl_store_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ysl_store_app/common/widgets/shimmers/shimmer.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: YAppBar(showBackArrow: true, title: Text('Profile')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage!.isNotEmpty
                          ? networkImage
                          : YImage.user;
                      return controller.imageUpLoading.value
                          ? YShimmerEffect(width: 80, height: 80, radius: 80)
                          : YCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: YSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: YSizes.spaceBtwItems),

              // Heading Profile Info
              const YSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              // Profile Info
              YProfileMenu(
                onPressed: () => Get.off(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              YProfileMenu(
                onPressed: () {},
                title: 'username',
                value: controller.user.value.username ?? '',
              ),

              const SizedBox(height: YSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: YSizes.spaceBtwItems),

              // Heading Personal Info
              const YSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              YProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              YProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email ?? '',
                onPressed: () {},
              ),
              YProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber ?? '',
                onPressed: () {},
              ),
              YProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              YProfileMenu(
                title: 'Date of Birth',
                value: '08 Sep, 2005',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(height: YSizes.spaceBtwItems),

              // Clos account
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
