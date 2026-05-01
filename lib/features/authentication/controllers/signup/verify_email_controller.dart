import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:fast_food/common/widgets/success_screen/success_screen.dart';
import 'package:fast_food/utils/constants/text_strings.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _redirectTimer;
  bool _hasHandledVerification = false;

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  @override
  void onClose() {
    _redirectTimer?.cancel();
    super.onClose();
  }

  /// --- Send Email Verification link
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      YLoaders.successSnackBar(
        title: 'Email Sent!',
        message:
        'Please check your inbox (and spam folder) to verify your email.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(
        title: 'Failed to Send Email',
        message:
        '${e.toString()}\n\nPlease check:\n1. Your internet connection\n2. Firebase email settings\n3. Try again in a few moments',
      );
    }
  }

  /// --- Timer to automatically redirect on Email Verification
  void setTimerForAutoRedirect() {
    _redirectTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        await _handleVerifiedEmailSuccess(timer);
      }
    });
  }

  /// --- Manually Check if Email Verified
  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      YLoaders.warningSnackBar(
        title: 'Session Expired',
        message: 'Please login again to continue.',
      );
      return;
    }

    await currentUser.reload();
    final refreshedUser = FirebaseAuth.instance.currentUser;

    if (refreshedUser?.emailVerified ?? false) {
      await _handleVerifiedEmailSuccess();
    } else {
      YLoaders.warningSnackBar(
        title: 'Not Verified Yet',
        message: 'Please verify your email, then tap Continue.',
      );
    }
  }

  Future<void> _handleVerifiedEmailSuccess([Timer? timer]) async {
    if (_hasHandledVerification) return;
    _hasHandledVerification = true;
    timer?.cancel();
    _redirectTimer?.cancel();

    Get.off(
          () => SuccessScreen(
        image: YImage.staticSuccessIllustration,
        title: YText.yourAccountCreatedTitle,
        subTitle: YText.yourAccountCreatedSubTitle,
        onPressed: () async {
          await AuthenticationRepository.instance.logout();
        },
      ),
    );
  }
}
