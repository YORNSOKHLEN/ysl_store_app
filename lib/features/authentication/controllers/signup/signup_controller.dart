import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/utils/constants/image_strings.dart';
import 'package:ysl_store_app/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/models/user_model.dart';
import '../../screens/signup/widgets/verify_email.dart';

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

  // // SignUp
  void signup() async {
    try {
      YFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        YImage.staticSuccessIllustration,
      );

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy
      if (!privacyPolicy.value) {
        YFullScreenLoader.stopLoading();
        YLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'You must accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // Register user
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      // SEND VERIFICATION EMAIL
      await AuthenticationRepository.instance.sendEmailVerification();

      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // STOP loader BEFORE navigation
      YFullScreenLoader.stopLoading();

      YLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      YFullScreenLoader.stopLoading();
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
