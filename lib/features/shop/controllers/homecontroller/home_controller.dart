import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get = Get.find();

  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }
}
