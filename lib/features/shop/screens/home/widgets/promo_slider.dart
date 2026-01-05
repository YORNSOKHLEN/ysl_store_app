import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/homecontroller/home_controller.dart';

class YPromoSlider extends StatelessWidget {
  const YPromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners
              .map(
                (url) => YRoundedImage(
                  imageUrl: url,
                  backgroundColor: YColors.light,
                ),
              )
              .toList(),
        ),
        SizedBox(height: YSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < 3; i++)
                  YCircularContainer(
                    height: 4,
                    width: 20,
                    margin: EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex == i
                        ? YColors.primary
                        : YColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
