import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/personalization/models/user_model.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Save user data to Firestore.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error when saving user');
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error when saving user');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// Fetch user details based on user ID.

  /// Update user data in Firestore (merge to avoid overwriting unspecified fields).
  Future<void> updateUserRecord(UserModel user) async {
    try {
      await _db
          .collection('Users')
          .doc(user.id)
          .set(user.toJson(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error when updating user');
    } on FormatException catch (e) {
      throw FormatException(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error when updating user');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }
}
