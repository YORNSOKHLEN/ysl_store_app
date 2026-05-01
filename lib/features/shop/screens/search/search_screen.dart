import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/product/product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, this.initialQuery});

  final String? initialQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final ProductController productController;
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    productController = Get.put(ProductController());
    searchController = TextEditingController(
      text: widget.initialQuery?.trim() ?? '',
    );

    // If an initial query was provided, perform the search once
    final init = widget.initialQuery?.trim();
    if (init != null && init.isNotEmpty) {
      // use a post-frame callback to ensure UI is ready
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productController.searchProducts(init);
      });
    }
  }

  @override
  void dispose() {
    productController.clearSearchResults();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(
        showBackArrow: true,
        title: TextField(
          controller: searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Iconsax.search_normal),
              onPressed: () {
                productController.searchProducts(searchController.text);
              },
            ),
          ),
          onChanged: (value) {
            productController.searchProducts(value);
          },
          onSubmitted: (value) {
            productController.searchProducts(value);
          },
        ),
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (productController.searchResults.isEmpty &&
            searchController.text.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.search_normal, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'Search for products',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter a product name to search',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }

        if (productController.searchResults.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.search_normal_1, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'No results found',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Try searching with different keywords',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(YSizes.defaultSpace),
            child: Column(
              children: [
                Text(
                  'Found ${productController.searchResults.length} results',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: YSizes.spaceBtwSections),
                YGridLayout(
                  itemCount: productController.searchResults.length,
                  itemBuilder: (_, index) => ProductCardVertical(
                    product: productController.searchResults[index],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
