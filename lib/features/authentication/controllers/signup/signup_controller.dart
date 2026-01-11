import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final hidePassword = true.obs; // Observable for password visibility
  final privacyPolicy = true.obs; // Observable for privacy policy checkbox
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  // SignUp
  Future<void> signup() async {
    try {
      // Start Loading
      YFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        YImage.staticSuccessIllustration,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        YLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase

      // Save Authenticated user data in the Firebase FireStore

      // Show Success Message

      // Move to Verify Email Screen
    } catch (e) {
      // Show some Generic Error to the user
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      YFullScreenLoader.stopLoading();
    }
  }
}
