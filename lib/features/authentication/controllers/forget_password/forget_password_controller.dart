import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ysl_store_app/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  Future<void> sendPasswordResetEmail() async {
    try {
      // Start Loading
      YFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        YImage.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Show Success Screen
      YLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email Link Sent to Reset your Password'.tr,
      );

      // Remove Loader
      YFullScreenLoader.stopLoading();

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      YFullScreenLoader.stopLoading();
      YLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      YFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        YImage.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Remove Loader
      YFullScreenLoader.stopLoading();

      // Show Success Screen
      YLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email Link Sent to Reset your Password'.tr,
      );
    } catch (e) {
      // Remove Loader
      YFullScreenLoader.stopLoading();
      YLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
