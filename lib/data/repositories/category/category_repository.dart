import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/category_model.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch categories');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while fetching categories');
    }
  }

  /// Get subcategories by parent ID
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((e) => CategoryModel.fromSnapshot(e))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch subcategories');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while fetching subcategories');
    }
  }


  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    final storage = Get.put(YFirebaseStorageService());

    for (var category in categories) {
      try {
        // Check for missing name or image
        if (category.name.isEmpty) {
          print('Skipping category: Name is empty (ID: ${category.id})');
          continue;
        }

        if (category.image.isEmpty) {
          print(
            'Warning: Category image is empty (ID: ${category.id}, Name: ${category.name})',
          );
        }

        // Try to get image data from assets if image is provided
        Uint8List? file;
        if (category.image.isNotEmpty) {
          try {
            file = await storage.getImageDataFromAssets(category.image);
          } catch (e) {
            print('Failed to get image from assets for ${category.name}: $e');
          }
        }

        // Upload image if file exists
        if (file != null) {
          try {
            final url = await storage.uploadImageData(
              'Categories',
              file,
              category.name,
            );
            category.image = url; // Assign uploaded URL
          } catch (e) {
            print('Failed to upload image for ${category.name}: $e');
          }
        }

        // Upload category to Firestore even if image upload failed
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
        print('Uploaded category: ${category.name} (ID: ${category.id})');
      } catch (e) {
        print('Failed to upload category ${category.name}: $e');
      }
    }

    print('All categories processed.');
  }
}
