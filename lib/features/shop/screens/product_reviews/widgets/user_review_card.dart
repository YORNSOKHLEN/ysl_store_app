import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/ratings/rating_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YUserReviewCard extends StatelessWidget {
  const YUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(YImage.userReview2),
                ),
                const SizedBox(width: YSizes.spaceBtwItems),
                Text('Sokh Len', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: YSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const YRatingBarIndicator(rating: 4),
            const SizedBox(width: YSizes.spaceBtwItems),
            Text('14 Jan, 2026', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: YSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Less',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: YColors.buttonPrimary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: YColors.buttonPrimary,
          ),
        ),
        const SizedBox(height: YSizes.spaceBtwItems),

        /// Company Review
        YRoundedContainer(
          backgroundColor: dark ? YColors.darkerGrey : YColors.reviewGrey,
          child: Padding(
            padding: const EdgeInsets.all(YSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "YSL Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '16 Jan, 2026',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: YSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: YColors.buttonPrimary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: YColors.buttonPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
