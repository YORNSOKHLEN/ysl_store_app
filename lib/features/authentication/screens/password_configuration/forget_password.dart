import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(YSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              YText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: YSizes.spaceBtwItems),
            Text(
              YText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: YSizes.spaceBtwSections * 2),

            // Text Field
            TextFormField(
              decoration: InputDecoration(
                labelText: YText.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),

            // Submit Button
          ],
        ),
      ),
    );
  }
}
