import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            expands: false,
            decoration: InputDecoration(
              labelText: YText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Email
          TextFormField(
            decoration: InputDecoration(
              labelText: YText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Phone number
          TextFormField(
            decoration: InputDecoration(
              labelText: YText.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Password
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: YText.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Terms and Conditions checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {}),
              ),
              const SizedBox(width: YSizes.spaceBtwItems),

              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${YText.iAgreeTo} ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: '${YText.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? YColors.light : YColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark
                              ? YColors.light
                              : YColors.primary,
                        ),
                      ),
                      TextSpan(
                        text: '${YText.and} ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: '${YText.termsOfUse} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? YColors.light : YColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark
                              ? YColors.light
                              : YColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: YSizes.spaceBtwInputField),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(YText.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
