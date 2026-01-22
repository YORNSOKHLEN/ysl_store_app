import 'package:get/get.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../../../utils/popups/loaders.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> categoryProducts = <ProductModel>[].obs;
  RxList<ProductModel> brandProducts = <ProductModel>[].obs;
  RxList<ProductModel> searchResults = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Stop Loader
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get the product price or price range for variations
  String? getProductPrice(ProductModel product) {
    // Show ONLY original price
    if (product.price > 0) {
      return product.price.toStringAsFixed(2);
    }

    // No valid price
    return null;
  }

  /// -- Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Final price

  String getFinalPrice(ProductModel product) {
    if (product.salePrice > 0 &&
        product.price > 0 &&
        product.salePrice < product.price) {
      return product.salePrice.toStringAsFixed(2);
    }

    return product.price.toStringAsFixed(2);
  }

  /// -- Check Product Stock Status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }


  /// Search products
  Future<void> searchProducts(String query) async {
    try {
      isLoading.value = true;
      final products = await productRepository.searchProducts(query);
      searchResults.assignAll(products);
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
