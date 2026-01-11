import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ysl_store_app/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:ysl_store_app/navigation_menu.dart';

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

  screenRedirect() async {
    final user = _auth.currentUser;
    // Ensure value exists FIRST
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }

    if (kDebugMode) {
      print(
        '=========================== GET STORAGE AUTH REPO ===========================',
      );
      print(deviceStorage.read('IsFirstTime'));
    }
  }

  /* -------------------------- Email & Password sign-in --------------------------*/

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Authentication failed');
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error occurred');
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Failed to send email verification');
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error occurred');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateUser() async {
    // TODO: Implement Re-authentication
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
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Failed to logout');
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error occurred');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while logging out');
    }
  }

  /// DELETE USER - Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    // TODO: Implement Account Deletion and Firestore cleanup
  }
}
