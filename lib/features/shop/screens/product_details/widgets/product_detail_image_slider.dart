import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YProductImageSlider extends StatelessWidget {
  const YProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return YCurvedEdgesWidgets(
      child: Container(
        color: dark ? YColors.darkerGrey : YColors.light,
        child: Stack(
          children: [
            /// Main Image
            SizedBox(
              height: 400,
              child: const Padding(
                padding: EdgeInsets.all(YSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(YImage.imageIphone17ProMaxOrange),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              bottom: 30,
              left: YSizes.defaultSpace,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: YSizes.spaceBtwItems),
                  itemCount: 6,
                  itemBuilder: (_, index) => YRoundedImage(
                    width: 80,
                    backgroundColor: dark ? YColors.dark : YColors.white,
                    border: Border.all(color: YColors.buttonPrimary),
                    padding: const EdgeInsets.all(YSizes.xs),
                    imageUrl: YImage.imageIphone17ProMaxBlack,
                  ),
                ),
              ),
            ),

            // Appbar
            YAppBar(
              showBackArrow: true,
              action: [YCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
          ],
        ),
      ),
    );
  }
}
