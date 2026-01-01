import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: YSizes.spaceBtwSections),
        child: Column(
          children: [
            // Input email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: YText.email,
              ),
            ),
            const SizedBox(height: YSizes.spaceBtwInputField),

            // Input password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: YText.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: YSizes.spaceBtwInputField),

            // Remember and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(YText.rememberMe),
                  ],
                ),

                // forget password
                TextButton(
                  onPressed: () => Get.to(() => ForgetPassword()),
                  child: Text(YText.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: YSizes.spaceBtwSections),

            //Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => NavigationMenu()),
                child: Text(YText.signIn),
              ),
            ),
            const SizedBox(height: YSizes.spaceBtwItems),

            // Create account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: const Text(YText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
