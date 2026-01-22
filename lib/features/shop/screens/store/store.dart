import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/common/widgets/appbar/tabbar.dart';
import 'package:ysl_store_app/common/widgets/layouts/grid_layout.dart';
import 'package:ysl_store_app/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:ysl_store_app/common/widgets/shimmers/brand_shimmer.dart';
import 'package:ysl_store_app/features/shop/controllers/category_controller.dart';
import 'package:ysl_store_app/features/shop/screens/brands/all_brands.dart';
import 'package:ysl_store_app/features/shop/screens/store/widgets/category_tab.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/brand_controller.dart';
import '../brands/brand_products.dart';
import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
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

                      /// -- Brands Grid
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const YBrandsShimmer();
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .apply(color: Colors.white),
                            ),
                          );
                        }

                        return YGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return YBrandCard(
                              showBorder: false,
                              brand: brand,
                              onTab: () =>
                                  Get.to(() => BrandProducts(brand: brand)),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),

                // Tabs
                bottom: YTabBar(
                  tabs: categories
                      .map((category) => Tab(child: Text(category.name)))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => YCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
