import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/common/widgets/appbar/tabbar.dart';
import 'package:ysl_store_app/common/widgets/layouts/grip_layout.dart';
import 'package:ysl_store_app/common/widgets/product/cart/cart_menu_icon.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/brand_card.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: YAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [YCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? YColors.black : YColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(YSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search bar
                      const SizedBox(height: YSizes.spaceBtwItems),
                      const YSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ), // TSea
                      const SizedBox(height: YSizes.spaceBtwSections),

                      /// -- Featured Brands
                      YSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),
                      const SizedBox(height: YSizes.spaceBtwItems / 1.5),

                      YGripLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return YBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                // Tabs
                bottom: YTabBar(
                  tabs: [
                    Tab(child: Text('SmartPhones')),
                    Tab(child: Text('SmartWatches')),
                    Tab(child: Text('HeadPhones')),
                    Tab(child: Text('EarPhones')),
                    Tab(child: Text('CoolingFans')),
                    Tab(child: Text('PowerBanks')),
                  ],
                ), // TTabBar
              ),
            ];
          },
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(YSizes.defaultSpace),
                child: Column(
                  children: [
                    /// -- Brands
                    YRoundedContainer(
                      showBorder: true,
                      borderColor: YColors.darkGrey,
                      backgroundColor: Colors.transparent,
                      margin: const EdgeInsets.only(
                        bottom: YSizes.spaceBtwItems,
                      ),
                      child: Column(
                        children: [
                          /// Brand with Products Count
                          const YBrandCard(showBorder: false),

                          /// Brand Top 3 Product Images
                          Row(
                            children: [
                              YRoundedContainer(
                                height: 100,
                                backgroundColor: dark
                                    ? YColors.darkerGrey
                                    : YColors.light,
                                margin: const EdgeInsets.only(right: YSizes.sm),
                                padding: const EdgeInsets.all(YSizes.md),
                                child: const Image(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    YImage.imageIphone17ProMaxOrange,
                                  ),
                                ),
                              ),
                              YRoundedContainer(
                                height: 100,
                                backgroundColor: dark
                                    ? YColors.darkerGrey
                                    : YColors.light,
                                margin: const EdgeInsets.only(right: YSizes.sm),
                                padding: const EdgeInsets.all(YSizes.md),
                                child: const Image(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    YImage.imageIphone17ProMaxOrange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
