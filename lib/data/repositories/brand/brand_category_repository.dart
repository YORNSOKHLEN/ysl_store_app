import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_category_model.dart';

class BrandCategoryRepository extends GetxService {
  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<BrandCategoryModel> data) async {
    final batch = _db.batch();

    for (final item in data) {
      final doc = _db.collection('BrandCategory').doc();
      batch.set(doc, item.toJson());
    }

    await batch.commit();
  }
}
