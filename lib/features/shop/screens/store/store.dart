import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/common/widgets/appbar/tabbar.dart';
import 'package:ysl_store_app/common/widgets/layouts/grid_layout.dart';
import 'package:ysl_store_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ysl_store_app/features/shop/screens/brands/all_brands.dart';
import 'package:ysl_store_app/features/shop/screens/store/widgets/category_tab.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../brands/brand_products.dart';
import '../cart/cart.dart';

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
          action: [
            YCartCounterIcon(onPressed: () => Get.to(() => CartScreen())),
          ],
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
                        onPressed: () => Get.to(() => AllBrandScreen()),
                      ),
                      const SizedBox(height: YSizes.spaceBtwItems / 1.5),

                      YGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return YBrandCard(
                            showBorder: false,
                            onTab: () => Get.to(() => BrandProducts()),
                          );
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
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              YCategoryTab(),
              YCategoryTab(),
              YCategoryTab(),
              YCategoryTab(),
              YCategoryTab(),
              YCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
