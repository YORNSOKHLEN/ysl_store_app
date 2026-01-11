import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ysl_store_app/features/authentication/screens/signup/widgets/terms_and_conditions_checkbox.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      YValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: YText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: YSizes.spaceBtwInputField),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      YValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: YText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                YValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: InputDecoration(
              labelText: YText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => YValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: YText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => YValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: YText.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Password
          Obx(() {
            return TextFormField(
              controller: controller.password,
              validator: (value) => YValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: YText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Terms and Conditions Checkbox
          YTermsAndConditionsCheckbox(),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: Text(YText.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
