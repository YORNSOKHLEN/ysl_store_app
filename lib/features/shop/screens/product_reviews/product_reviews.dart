import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fast_food/common/widgets/appbar/appbar.dart';
import 'package:fast_food/common/widgets/product/ratings/rating_indicator.dart';
import 'package:fast_food/data/repositories/authentication/authentication_repository.dart';
import 'package:fast_food/data/repositories/review/review_repository.dart';
import 'package:fast_food/features/shop/models/product_model.dart';
import 'package:fast_food/features/shop/models/review_model.dart';
import 'package:fast_food/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:fast_food/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:fast_food/utils/constants/colors.dart';
import 'package:fast_food/utils/constants/sizes.dart';
import 'package:fast_food/utils/popups/loaders.dart';

class ProductReviewsScreen extends StatefulWidget {
  const ProductReviewsScreen({super.key, this.product});

  final ProductModel? product;

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  late final ReviewRepository _reviewRepository;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();

  double _selectedRating = 0;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _reviewRepository = Get.isRegistered<ReviewRepository>()
        ? Get.find<ReviewRepository>()
        : Get.put(ReviewRepository());
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    final product = widget.product;

    if (product == null) {
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedRating <= 0) {
      YLoaders.warningSnackBar(
        title: 'Rating required',
        message: 'Please select a rating before submitting your review.',
      );
      return;
    }

    final authUser = AuthenticationRepository.instance.authUser;
    if (authUser == null) {
      YLoaders.warningSnackBar(
        title: 'Sign in required',
        message: 'Please sign in before writing a review.',
      );
      return;
    }

    final displayName = authUser.displayName?.trim();
    final userName = displayName != null && displayName.isNotEmpty
        ? displayName
        : (authUser.email?.split('@').first ?? 'Anonymous');

    setState(() => _isSubmitting = true);

    try {
      await _reviewRepository.addReview(
        ReviewModel(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          productId: product.id,
          userId: authUser.uid,
          userName: userName,
          userImage: authUser.photoURL ?? '',
          rating: _selectedRating,
          comment: _reviewController.text.trim(),
          createdAt: DateTime.now(),
        ),
      );

      _reviewController.clear();
      setState(() => _selectedRating = 0);

      YLoaders.successSnackBar(
        title: 'Review posted',
        message: 'Your review has been added to the timeline.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  Future<void> _deleteReview(String reviewId) async {
    try {
      await _reviewRepository.deleteReview(reviewId);
      YLoaders.successSnackBar(
        title: 'Review deleted',
        message: 'Your review has been removed from the timeline.',
      );
    } catch (e) {
      YLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  _ReviewSummary _buildSummary(List<ReviewModel> reviews) {
    if (reviews.isEmpty) {
      return const _ReviewSummary(
        averageRating: 0,
        totalReviews: 0,
        ratingCounts: <int, int>{},
      );
    }

    final totalReviews = reviews.length;
    final totalRating = reviews.fold<double>(0, (sum, review) => sum + review.rating);
    final ratingCounts = <int, int>{for (final rating in [1, 2, 3, 4, 5]) rating: 0};

    for (final review in reviews) {
      final normalizedRating = review.rating.round().clamp(1, 5);
      ratingCounts[normalizedRating] = (ratingCounts[normalizedRating] ?? 0) + 1;
    }

    return _ReviewSummary(
      averageRating: totalRating / totalReviews,
      totalReviews: totalReviews,
      ratingCounts: ratingCounts,
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final currentUserId = AuthenticationRepository.instance.authUser?.uid;

    return Scaffold(
      appBar: YAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: product == null
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(YSizes.defaultSpace),
                child: Text('Select a product to view and write reviews.'),
              ),
            )
          : StreamBuilder<List<ReviewModel>>(
              stream: _reviewRepository.watchProductReviews(product.id),
              builder: (context, snapshot) {
                final reviews = snapshot.data ?? const <ReviewModel>[];
                final summary = _buildSummary(reviews);

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(YSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Share your real experience with ${product.title}.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: YSizes.spaceBtwSections),

                        Text(
                          'Write a Review',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: YSizes.spaceBtwItems),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your rating',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: YSizes.spaceBtwItems / 2),
                              RatingBar.builder(
                                initialRating: _selectedRating,
                                minRating: 1,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemSize: 30,
                                itemBuilder: (context, index) => const Icon(
                                  Iconsax.star1,
                                  color: YColors.buttonPrimary,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() => _selectedRating = rating);
                                },
                              ),
                              const SizedBox(height: YSizes.spaceBtwItems),
                              TextFormField(
                                controller: _reviewController,
                                maxLines: 4,
                                decoration: const InputDecoration(
                                  labelText: 'Write your review',
                                  hintText: 'Tell others what you think...',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a review';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: YSizes.spaceBtwItems),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _isSubmitting ? null : _submitReview,
                                  child: Text(
                                    _isSubmitting ? 'Posting...' : 'Submit Review',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: YSizes.spaceBtwSections),

                        Text(
                          'Timeline',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: YSizes.spaceBtwItems),
                        YOverallProductRatings(
                          averageRating: summary.averageRating,
                          totalReviews: summary.totalReviews,
                          ratingCounts: summary.ratingCounts,
                        ),
                        const SizedBox(height: YSizes.spaceBtwItems),
                        YRatingBarIndicator(rating: summary.averageRating),
                        const SizedBox(height: YSizes.spaceBtwItems / 2),
                        Text(
                          '${summary.totalReviews} ${summary.totalReviews == 1 ? 'review' : 'reviews'}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: YSizes.spaceBtwSections),

                        if (snapshot.connectionState == ConnectionState.waiting &&
                            reviews.isEmpty)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: YSizes.lg),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        else if (reviews.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: YSizes.lg,
                            ),
                            child: Text(
                              'No reviews yet. Be the first to review this product.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        else
                          ListView.separated(
                            itemCount: reviews.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: YSizes.spaceBtwItems),
                            itemBuilder: (context, index) {
                              final review = reviews[index];
                              final canDelete =
                                  currentUserId != null &&
                                  review.userId == currentUserId;

                              return YUserReviewCard(
                                review: review,
                                canDelete: canDelete,
                                onDelete: canDelete
                                    ? () => _deleteReview(review.id)
                                    : null,
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _ReviewSummary {
  const _ReviewSummary({
    required this.averageRating,
    required this.totalReviews,
    required this.ratingCounts,
  });

  final double averageRating;
  final int totalReviews;
  final Map<int, int> ratingCounts;
}

