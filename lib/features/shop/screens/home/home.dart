import 'package:flutter/material.dart';
import 'package:ysl_store_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ysl_store_app/utils/constants/colors.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            YPrimaryHeaderContainer(
              child: Column(
                children: [
                  // App Bar
                  YHomeAppBar(),
                  SizedBox(height: YSizes.spaceBtwSections),

                  //Searchbar
                  YSearchContainer(text: 'Search in Store'),
                  SizedBox(height: YSizes.spaceBtwSections),

                  // Categories and Heading
                  Padding(
                    padding: EdgeInsets.only(left: YSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        YSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(height: YSizes.spaceBtwItems),

                        // Categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: 56,
                                    height: 56,
                                    padding: const EdgeInsets.all(YSizes.sm),
                                    decoration: BoxDecoration(
                                      color: YColors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(''),
                                        fit: BoxFit.cover,
                                        color: YColors.dark,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
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
    );
  }
}
