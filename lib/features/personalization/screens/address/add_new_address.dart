import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const YAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                /// Name
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Full Name',
                  ),
                ),
                const SizedBox(height: YSizes.spaceBtwInputField),

                /// Phone
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: YSizes.spaceBtwInputField),

                /// House No & Street
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.house),
                          labelText: 'House No',
                        ),
                      ),
                    ),
                    const SizedBox(width: YSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.add_road),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: YSizes.spaceBtwInputField),

                /// Sangkat & Khan
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'Sangkat (Commune)',
                        ),
                      ),
                    ),
                    const SizedBox(width: YSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.buildings),
                          labelText: 'Khan / District',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: YSizes.spaceBtwInputField),

                /// City & Province
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.location),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: YSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.map),
                          labelText: 'Province',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: YSizes.spaceBtwInputField),

                /// Country
                TextFormField(
                  initialValue: 'Cambodia',
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: YSizes.defaultSpace),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
