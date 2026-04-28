import 'package:flutter/material.dart';
import 'package:ysl_store_app/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class YOverallProductRatings extends StatelessWidget {
  const YOverallProductRatings({
    super.key,
    required this.averageRating,
    required this.totalReviews,
    required this.ratingCounts,
  });

  final double averageRating;
  final int totalReviews;
  final Map<int, int> ratingCounts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                averageRating.toStringAsFixed(1),
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                '$totalReviews Reviews',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              for (final rating in [5, 4, 3, 2, 1])
                YRatingProgressIndicator(
                  text: rating.toString(),
                  value: totalReviews == 0
                      ? 0
                      : (ratingCounts[rating] ?? 0) / totalReviews,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
