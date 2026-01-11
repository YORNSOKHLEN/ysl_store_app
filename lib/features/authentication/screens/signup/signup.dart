import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/common/widgets/login_signup/form_divider.dart';
import 'package:ysl_store_app/common/widgets/login_signup/social_buttons.dart';
import 'package:ysl_store_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';
import 'package:ysl_store_app/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              // Title
              Text(
                YText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Form
              SignupForm(),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Divider
              FormDivider(dividerText: YText.orSignUpWith.capitalize!),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Social Button
              SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
