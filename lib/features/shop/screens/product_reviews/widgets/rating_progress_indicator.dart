import 'package:flutter/material.dart';
import 'package:ysl_store_app/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class YOverallProductRatings extends StatelessWidget {
  const YOverallProductRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text('4.8', style: Theme.of(context).textTheme.displayLarge),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              YRatingProgressIndicator(text: '5', value: 1),
              YRatingProgressIndicator(text: '4', value: 0.8),
              YRatingProgressIndicator(text: '3', value: 0.6),
              YRatingProgressIndicator(text: '2', value: 0.4),
              YRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}
