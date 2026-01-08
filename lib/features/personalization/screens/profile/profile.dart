import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/features/personalization/screens/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircleAvatar(
                      backgroundImage: AssetImage(YImage.userReview2),
                      radius: 40,
                    ),
                    TextButton(
                      onPressed: () {},
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
                onPressed: () {},
                title: 'Name',
                value: 'Yorn Sokhlen',
              ),
              YProfileMenu(
                onPressed: () {},
                title: 'username',
                value: 'yorn_sokhlen',
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
                value: '3333',
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              YProfileMenu(
                title: 'E-mail',
                value: 'yornsokhlen33@email.com',
                onPressed: () {},
              ),
              YProfileMenu(
                title: 'Phone Number',
                value: '+855 96 280 7801',
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
                  onPressed: () {},
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
