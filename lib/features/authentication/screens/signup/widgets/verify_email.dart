import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/authentication/screens/login/login.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/success_screen/success_screen.dart';
import '../../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(YImage.deliveredEmailIllustration),
                width: YHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Title & Submit
              Text(
                YText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: YSizes.spaceBtwItems),
              Text(
                'Support@yornsokhlen.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: YSizes.spaceBtwItems),
              Text(
                YText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: YImage.staticSuccessIllustration,
                      title: YText.yourAccountCreatedTitle,
                      subtitle: YText.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(() => const LoginScreen()),
                    ),
                  ),
                  child: const Text(YText.yContinue),
                ),
              ),
              const SizedBox(height: YSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(YText.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
