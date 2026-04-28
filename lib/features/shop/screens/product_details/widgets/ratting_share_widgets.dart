import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import 'package:ysl_store_app/data/repositories/review/review_repository.dart';
import 'package:ysl_store_app/features/shop/models/review_model.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../features/shop/models/product_model.dart';

class YRattingAndShare extends StatelessWidget {
  const YRattingAndShare({super.key, required this.product});

  final ProductModel product;

  ReviewRepository _reviewRepository() {
    return Get.isRegistered<ReviewRepository>()
        ? Get.find<ReviewRepository>()
        : Get.put(ReviewRepository());
  }

  _ReviewSummary _buildSummary(List<ReviewModel> reviews) {
    if (reviews.isEmpty) {
      return const _ReviewSummary(averageRating: 0, totalReviews: 0);
    }

    final totalReviews = reviews.length;
    final totalRating = reviews.fold<double>(0, (sum, review) => sum + review.rating);

    return _ReviewSummary(
      averageRating: totalRating / totalReviews,
      totalReviews: totalReviews,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ReviewModel>>(
      stream: _reviewRepository().watchProductReviews(product.id),
      builder: (context, snapshot) {
        final summary = _buildSummary(snapshot.data ?? const <ReviewModel>[]);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Rating
            Row(
              children: [
                const Icon(Iconsax.star5, color: Colors.amber, size: 24),
                const SizedBox(width: YSizes.spaceBtwItems / 2),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${summary.averageRating.toStringAsFixed(1)} ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextSpan(text: '(${summary.totalReviews})'),
                    ],
                  ),
                ),
              ],
            ),

            // Share  Button
            IconButton(
              onPressed: () {
                // Share functionality - can be implemented with share_plus package if needed
                // For now, just show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sharing ${product.title}')),
                );
              },
              icon: Icon(Icons.share, size: YSizes.iconMd),
            ),
          ],
        );
      },
    );
  }
}

class _ReviewSummary {
  const _ReviewSummary({
    required this.averageRating,
    required this.totalReviews,
  });

  final double averageRating;
  final int totalReviews;
}

