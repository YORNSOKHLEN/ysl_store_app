import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_category_model.dart';
import '../../../features/shop/models/brand_model.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs
          .map((e) => BrandModel.fromSnapshot(e))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch brands');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while fetching brands');
    }
  }

  /// Get featured brands
  Future<List<BrandModel>> getFeaturedBrands() async {
    try {
      final snapshot = await _db
          .collection('Brands')
          .where('IsFeatured', isEqualTo: true)
          .get();
      final list = snapshot.docs.map((document) {
        final data = document.data();
        return BrandModel.fromJson(data);
      }).toList();
      return list;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch featured brands');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while fetching featured brands');
    }
  }

  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs
          .map((doc) => BrandModel.fromSnapshot(doc))
          .toList();

      return brands;
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch brands');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while fetching brands');
    }
  }

  /// Get brand by ID
  Future<BrandModel> getBrandById(String brandId) async {
    try {
      final document = await _db.collection('Brands').doc(brandId).get();
      if (document.exists) {
        return BrandModel.fromJson(document.data()!);
      } else {
        return BrandModel.empty();
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch brand');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong while fetching brand');
    }
  }

  /// Upload Brands to the Cloud Firebase
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // Upload all the Brands along with their Images
      final storage = Get.put(YFirebaseStorageService());

      // Loop through each brand
      for (var brand in brands) {
        // Skip if image is empty
        if (brand.image.isEmpty) {
          // Store Brand in Firestore without image
          await _db.collection("Brands").doc(brand.id).set(brand.toJson());
          continue;
        }

        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Brands', file, brand.name);

        // Assign URL to Brand.image attribute
        brand.image = url;

        // Store Brand in Firestore
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message ?? 'Firebase error occurred');
    } on PlatformException catch (e) {
      throw Exception(e.message ?? 'Platform error occurred');
    } catch (e) {
      throw Exception('Something went wrong. Please try again');
    }
  }

  /// Upload BrandCategory Dummy Data
  Future<void> uploadBrandCategoryDummyData(
      List<BrandCategoryModel> brandCategories,
      ) async {
    try {
      for (final item in brandCategories) {
        await _db.collection('BrandCategory').add(item.toJson());
      }
    } catch (e) {
      debugPrint('uploadBrandCategoryDummyData error: $e');
    }
  }
}
