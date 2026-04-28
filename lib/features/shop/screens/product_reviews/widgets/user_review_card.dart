import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:ysl_store_app/features/shop/models/review_model.dart';

import '../../../../../common/widgets/product/ratings/rating_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class YUserReviewCard extends StatelessWidget {
  const YUserReviewCard({
    super.key,
    required this.review,
    this.canDelete = false,
    this.onDelete,
  });

  final ReviewModel review;
  final bool canDelete;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final dark = YHelperFunctions.isDarkMode(context);
    final userName = review.userName.trim().isEmpty
        ? 'Anonymous'
        : review.userName;
    final initials = userName.isNotEmpty ? userName[0].toUpperCase() : '?';
    final hasNetworkImage = review.userImage.startsWith('http');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(YSizes.md),
          decoration: BoxDecoration(
            color: dark ? YColors.darkerGrey : YColors.white,
            borderRadius: BorderRadius.circular(YSizes.cardRadiusLg),
            border: Border.all(color: dark ? YColors.darkGrey : YColors.grey),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: YColors.buttonPrimary,
                        backgroundImage: hasNetworkImage
                            ? NetworkImage(review.userImage)
                            : null,
                        child: hasNetworkImage
                            ? null
                            : Text(
                                initials,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: YColors.white),
                              ),
                      ),
                      const SizedBox(width: YSizes.spaceBtwItems),
                      Text(userName, style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        YHelperFunctions.getFormattedDate(review.createdAt),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      if (canDelete && onDelete != null)
                        PopupMenuButton<String>(
                          icon: const Icon(Icons.more_vert),
                          onSelected: (value) async {
                            if (value != 'delete') return;

                            final shouldDelete = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) {
                                return AlertDialog(
                                  title: const Text('Delete review'),
                                  content: const Text(
                                    'Are you sure you want to delete this review?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(
                                        dialogContext,
                                      ).pop(false),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(
                                        dialogContext,
                                      ).pop(true),
                                      child: const Text('Delete'),
                                    ),
                                  ],
                                );
                              },
                            );

                            if (shouldDelete == true) {
                              onDelete!();
                            }
                          },
                          itemBuilder: (context) => const [
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: Text('Delete review'),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: YSizes.spaceBtwItems),

              Row(
                children: [
                  YRatingBarIndicator(rating: review.rating),
                  const SizedBox(width: YSizes.spaceBtwItems),
                  Text(
                    review.rating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: YSizes.spaceBtwItems),
              ReadMoreText(
                review.comment,
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Less',
                moreStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: YColors.buttonPrimary,
                ),
                lessStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: YColors.buttonPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
