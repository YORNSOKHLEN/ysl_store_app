// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ysl_store_app/data/repositories/authentication/authentication_repository.dart';
// import 'package:ysl_store_app/features/authentication/screens/login/login.dart';
// import 'package:ysl_store_app/utils/constants/image_strings.dart';
// import 'package:ysl_store_app/utils/constants/sizes.dart';
// import 'package:ysl_store_app/utils/helpers/helper_functions.dart';
//
// import '../../../../../utils/constants/text_strings.dart';
// import '../../../controllers/signup/verify_email_controller.dart';
//
// class VerifyEmailScreen extends StatelessWidget {
//   const VerifyEmailScreen({super.key, this.email});
//
//   final String? email;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(VerifyEmailController());
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () => AuthenticationRepository.instance.logout(),
//             icon: Icon(CupertinoIcons.clear),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(YSizes.defaultSpace),
//           child: Column(
//             children: [
//               // Image
//               Image(
//                 image: AssetImage(YImage.deliveredEmailIllustration),
//                 width: YHelperFunctions.screenWidth() * 0.6,
//               ),
//               const SizedBox(height: YSizes.spaceBtwSections),
//
//               // Title & Submit
//               Text(
//                 YText.confirmEmail,
//                 style: Theme.of(context).textTheme.headlineMedium,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: YSizes.spaceBtwItems),
//               Text(
//                 email ?? '',
//                 style: Theme.of(context).textTheme.labelLarge,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: YSizes.spaceBtwItems),
//               Text(
//                 YText.confirmEmailSubTitle,
//                 style: Theme.of(context).textTheme.labelMedium,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: YSizes.spaceBtwSections),
//
//               // Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => controller.checkEmailVerificationStatus(),
//                   child: const Text(YText.yContinue),
//                 ),
//               ),
//               const SizedBox(height: YSizes.spaceBtwItems),
//               SizedBox(
//                 width: double.infinity,
//                 child: TextButton(
//                   onPressed: () => controller.sendEmailVerification(),
//                   child: const Text(YText.resendEmail),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';
import 'package:ysl_store_app/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/signup/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    // Use Get.put only if the controller is not already instantiated
    final controller = Get.put(VerifyEmailController(), permanent: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image.asset(
                YImage.deliveredEmailIllustration,
                width: YHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: YSizes.spaceBtwSections),

              // Title & Email
              Text(
                YText.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: YSizes.spaceBtwItems),
              Text(
                email ?? '',
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

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(YText.yContinue),
                ),
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              // Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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
