import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    // Ensure value exists FIRST

    if (kDebugMode) {
      print(
        '=========================== GET STORAGE AUTH REPO ===========================',
      );
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* -------------------------- Email & Password sign-in --------------------------*/

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - REGISTER
  Future<void> registerWithEmail(String email, String password) async {
    // TODO: Implement Registration
  }

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateUser() async {
    // TODO: Implement Re-authentication
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    // TODO: Implement Email Verification
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    // TODO: Implement Password Reset
  }

  /* -------------------- Federated identity & social sign-in --------------------*/

  /// [GoogleAuthentication] - GOOGLE
  Future<void> signInWithGoogle() async {
    // TODO: Implement Google Sign In
  }

  /// [FacebookAuthentication] - FACEBOOK
  Future<void> signInWithFacebook() async {
    // TODO: Implement Facebook Sign In
  }

  /* ------------------ ./end Federated identity & social sign-in ----------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    // TODO: Implement Logout
  }

  /// DELETE USER - Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    // TODO: Implement Account Deletion and Firestore cleanup
  }
}
