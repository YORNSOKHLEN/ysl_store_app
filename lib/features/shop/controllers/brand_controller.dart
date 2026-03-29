import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/brand/brand_repository.dart';
import '../../../data/repositories/product/product_repository.dart';
import '../models/brand_model.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final brandRepository = Get.put(BrandRepository());

  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// Fetch featured brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);
      featuredBrands.assignAll(
        allBrands.where((b) => b.isFeatured ?? false).take(4),
      );
    } catch (e) {
      debugPrint('getFeaturedBrands error: $e');
      allBrands.clear();
      featuredBrands.clear();
    } finally {
      isLoading.value = false;
    }
  }

  /// Get Brand Products
  Future<List<ProductModel>> getBrandProducts({
    required String brandId,
    int limit = -1,
  }) async {
    try {
      return await ProductRepository.instance.getProductsForBrand(
        brandId: brandId,
        limit: limit,
      );
    } catch (e) {
      debugPrint('getBrandProducts error: $e');
      return [];
    }
  }

  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      return await brandRepository.getBrandsForCategory(categoryId);
    } catch (e) {
      debugPrint('getBrandsForCategory error: $e');
      return [];
    }
  }
}
