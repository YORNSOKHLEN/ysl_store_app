import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:fast_food/common/widgets/texts/section_heading.dart';
import 'package:fast_food/features/shop/controllers/product/cart_controller.dart';
import 'package:fast_food/features/shop/models/product_model.dart';
import 'package:fast_food/features/shop/screens/product_details/widgets/button_add_to_cart_widgets.dart';
import 'package:fast_food/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:fast_food/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:fast_food/features/shop/screens/product_details/widgets/ratting_share_widgets.dart';
import 'package:fast_food/utils/constants/sizes.dart';

import '../checkout/checkout.dart';
import '../product_reviews/product_reviews.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late final CartController cartController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    cartController = CartController.instance;
    cartController.updateAlreadyAddedProductCount(widget.product);

    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final product = widget.product;

    return Scaffold(
      bottomNavigationBar: YButtonAddToCartWidgets(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            YProductImageSlider(product: product),

            // Product Details
            Padding(
              padding: EdgeInsets.only(
                right: YSizes.defaultSpace,
                left: YSizes.defaultSpace,
                bottom: YSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Ratting & Share Button
                  YRattingAndShare(product: product),

                  // Price Title Stock Brand
                  YProductMetaData(product: product),

                  // Attributes
                  // Better: Grouped with a spread operator
                  // if (product.productType == ProductType.variable.toString())
                  //   YProductAttributes(product: product),
                  // if (product.productType == ProductType.variable.toString())
                  //   const SizedBox(height: YSizes.spaceBtwSections),

                  // Check out
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          cartController.addToCart(product);
                          Get.to(() => const CheckoutScreen());
                        },
                        child: Text('Check out \$${(product.salePrice > 0 ? product.salePrice : product.price) * cartController.productQuantityInCart.value}'),
                      ),
                    ),
                  ),
                  SizedBox(height: YSizes.spaceBtwSections),

                  // Description
                  YSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(height: YSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? 'No description available',
                    trimLines: 3,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // Review
                  const Divider(),
                  SizedBox(height: YSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      YSectionHeading(
                        title: 'Reviews',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => ProductReviewsScreen(product: product)),
                        icon: const Icon(Iconsax.arrow_right_3),
                      ),
                    ],
                  ),
                  SizedBox(height: YSizes.spaceBtwSections),
                  // Review Card
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
