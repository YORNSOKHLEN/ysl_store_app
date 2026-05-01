import 'package:get/get.dart';
import 'package:fast_food/data/dummy/dummy_data.dart';
import 'package:fast_food/data/repositories/banners/banner_repository.dart';
import 'package:fast_food/data/repositories/brand/brand_repository.dart';
import 'package:fast_food/data/repositories/category/category_repository.dart';
import 'package:fast_food/data/repositories/product/product_repository.dart';
import 'package:fast_food/utils/constants/image_strings.dart';
import 'package:fast_food/utils/popups/full_screen_loader.dart';
import 'package:fast_food/utils/popups/loaders.dart';

/// Service for uploading dummy data to Firebase
class DataUploadService extends GetxService {
  static DataUploadService get instance => Get.find();

  /// Upload all dummy data to Firebase sequentially
  Future<void> uploadAllData() async {
    try {
      // Show loading with initial message
      YFullScreenLoader.openLoadingDialog(
        'Uploading data to Firebase...',
        YImage.docerAnimation,
      );

      // Get repository instances (already registered in GeneralBindings)
      final categoryRepo = Get.put(CategoryRepository());
      final brandRepo = Get.put(BrandRepository());
      final productRepo = Get.put(ProductRepository());
      final bannerRepo = Get.put(BannerRepository());
      // final brandCategoryRepo = Get.put(BrandCategoryRepository());
      // final productCategoryRepo = Get.put(ProductCategoryRepository());

      // Upload Brand Categories first
      // YFullScreenLoader.updateMessage('Uploading brand categories...');
      // await brandCategoryRepo.uploadDummyData(YDummyData.brandCategories);
      //
      // // Upload Product Categories first
      // YFullScreenLoader.updateMessage('Uploading product categories...');
      // await productCategoryRepo.uploadDummyData(YDummyData.productCategories);

      // Upload Categories first
      YFullScreenLoader.updateMessage('Uploading categories...');
      await categoryRepo.uploadDummyData(YDummyData.categories);

      // Upload Brands
      YFullScreenLoader.updateMessage('Uploading brands...');
      await brandRepo.uploadDummyData(YDummyData.brands);

      // Upload Products
      YFullScreenLoader.updateMessage('Uploading products...');
      await productRepo.uploadDummyData(YDummyData.products);

      // Upload Banners
      YFullScreenLoader.updateMessage('Uploading banners...');
      await bannerRepo.uploadDummyData(YDummyData.banners);

      // Success
      YLoaders.successSnackBar(
        title: 'Success!',
        message: 'All dummy data uploaded to Firebase successfully!',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    } finally {
      // Stop loader after all uploads finish
      YFullScreenLoader.stopLoading();
    }
  }

  /// Upload only Categories
  Future<void> uploadCategories() async {
    try {
      YFullScreenLoader.openLoadingDialog(
        'Uploading categories...',
        YImage.docerAnimation,
      );
      final categoryRepo = Get.find<CategoryRepository>();
      await categoryRepo.uploadDummyData(YDummyData.categories);

      YLoaders.successSnackBar(
        title: 'Success!',
        message: 'Categories uploaded successfully.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    } finally {
      YFullScreenLoader.stopLoading();
    }
  }

  /// Upload only Products
  Future<void> uploadProducts() async {
    try {
      YFullScreenLoader.openLoadingDialog(
        'Uploading products...',
        YImage.docerAnimation,
      );
      final productRepo = Get.find<ProductRepository>();
      await productRepo.uploadDummyData(YDummyData.products);

      YLoaders.successSnackBar(
        title: 'Success!',
        message: 'Products uploaded successfully.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    } finally {
      YFullScreenLoader.stopLoading();
    }
  }

  /// Upload only Brands
  Future<void> uploadBrands() async {
    try {
      YFullScreenLoader.openLoadingDialog(
        'Uploading brands...',
        YImage.docerAnimation,
      );
      final brandRepo = Get.find<BrandRepository>();
      await brandRepo.uploadDummyData(YDummyData.brands);

      YLoaders.successSnackBar(
        title: 'Success!',
        message: 'Brands uploaded successfully.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    } finally {
      YFullScreenLoader.stopLoading();
    }
  }

  /// Upload only Banners
  Future<void> uploadBanners() async {
    try {
      YFullScreenLoader.openLoadingDialog(
        'Uploading banners...',
        YImage.docerAnimation,
      );
      final bannerRepo = Get.find<BannerRepository>();
      await bannerRepo.uploadDummyData(YDummyData.banners);

      YLoaders.successSnackBar(
        title: 'Success!',
        message: 'Banners uploaded successfully.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    } finally {
      YFullScreenLoader.stopLoading();
    }
  }
}
