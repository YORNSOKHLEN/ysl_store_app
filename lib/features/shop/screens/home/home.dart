import 'package:flutter/material.dart';
import 'package:ysl_store_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:ysl_store_app/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';

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

                  // Categories
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
