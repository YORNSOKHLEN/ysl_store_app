import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../../features/shop/models/product_category_model.dart';

class ProductCategoryRepository extends GetxService {
  final _db = FirebaseFirestore.instance;

  Future<void> uploadDummyData(List<ProductCategoryModel> data) async {
    final batch = _db.batch();

    for (final item in data) {
      final doc = _db.collection('ProductCategory').doc();
      batch.set(doc, item.toJson());
    }

    await batch.commit();
  }
}
