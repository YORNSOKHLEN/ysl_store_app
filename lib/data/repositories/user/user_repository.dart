import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/personalization/models/user_model.dart';
import '../authentication/authentication_repository.dart';

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
  Future<UserModel> fetchUserDetails() async {
    try {
      // Pass the specific userId you want to fetch
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();

      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error when fetching user data');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error when fetching user data');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// Update user data in Firestore (merge to avoid overwriting unspecified fields).
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updateUser.id)
          .update(updateUser.toJson());
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

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error when updating user field');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error when updating user field');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error when deleting user');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error when deleting user');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      // Create a reference to the storage location
      final ref = FirebaseStorage.instance.ref(path).child(image.name);

      // Upload the file
      await ref.putFile(File(image.path));

      // Fetch and return the download URL
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error while uploading image');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error while uploading image');
    } catch (e) {
      throw Exception('Something went wrong while uploading image');
    }
  }
}
