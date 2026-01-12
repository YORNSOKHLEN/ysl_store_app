import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/personalization/controllers/user_controller.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../screens/profile/profile.dart';

/// Controller to manage user-related functionality.
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName!;
    lastName.text = userController.user.value.lastName!;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      YFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        YImage.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        YFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      YFullScreenLoader.stopLoading();

      // Show Success Message
      YLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your Name has been updated.',
      );

      // Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      YFullScreenLoader.stopLoading();
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
