import 'package:flutter/material.dart';
import 'package:ysl_store_app/common/widgets/appbar/appbar.dart';
import 'package:ysl_store_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ysl_store_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';

import '../../../../common/widgets/product/ratings/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YAppBar(title: Text('Reviews & Ratting'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(YSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use.",
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              // Overall Product Ratings
              YOverallProductRatings(),
              YRatingBarIndicator(rating: 3.5),
              Text('33,333', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: YSizes.spaceBtwSections),

              // User Review List
              YUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
