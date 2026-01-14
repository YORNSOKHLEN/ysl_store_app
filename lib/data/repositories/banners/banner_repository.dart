import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_model.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw 'Firebase Exception: ${e.message}';
    } on FormatException catch (_) {
      throw 'Format Exception: Invalid data format';
    } on PlatformException catch (e) {
      throw 'Platform Exception: ${e.message}';
    } catch (e) {
      throw 'Something went wrong while fetching banners: $e';
    }
  }

  // Upload Banners to Cloud Firebase
}
