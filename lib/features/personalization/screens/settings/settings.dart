import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fast_food/common/widgets/appbar/appbar.dart';
import 'package:fast_food/features/personalization/screens/address/address.dart';
import 'package:fast_food/features/personalization/screens/profile/profile.dart';
import 'package:fast_food/features/shop/screens/order/order.dart';
import 'package:fast_food/utils/constants/colors.dart';
import 'package:fast_food/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tile/settings_menu_tile.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/services/data_upload_service.dart';
import '../../../shop/screens/cart/cart.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            YPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  YAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: YColors.white),
                    ),
                  ),

                  // User Profile Tile
                  YUserProfileTile(
                    onPressed: () => Get.to(() => ProfileScreen()),
                  ),

                  const SizedBox(height: YSizes.spaceBtwSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(YSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const YSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: YSizes.spaceBtwItems),

                  YSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  YSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  YSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  const YSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                  ),
                  const YSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                  ),
                  const YSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification message',
                  ),
                  const YSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                  ),
                  const SizedBox(height: YSizes.spaceBtwSections),

                  /// -- App Settings
                  const YSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: YSizes.spaceBtwItems),
                  YSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload all dummy data to Cloud Firebase',
                    onTap: () async {
                      // Show confirmation dialog
                      final confirm = await Get.dialog<bool>(
                        AlertDialog(
                          title: const Text('Upload Data'),
                          content: const Text(
                            'This will upload all dummy data (Categories, Brands, Products, Banners) to Firebase. This may take a few minutes. Continue?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(result: false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Get.back(result: true),
                              child: const Text('Upload'),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true) {
                        await DataUploadService.instance.uploadAllData();
                      }
                    },
                  ),
                  YSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  YSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  // YSettingsMenuTile(
                  //   icon: Iconsax.image,
                  //   title: 'HD Image Quality',
                  //   subTitle: 'Set image quality to be seen',
                  //   trailing: Switch(value: false, onChanged: (value) {}),
                  // ),
                  const SizedBox(height: YSizes.spaceBtwSections),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      child: Text('Log out'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
