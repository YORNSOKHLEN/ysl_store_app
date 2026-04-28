import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../authentication/authentication_repository.dart';
import '../../../features/shop/models/review_model.dart';

class ReviewRepository extends GetxService {
  final _db = FirebaseFirestore.instance;

  Future<void> addReview(ReviewModel review) async {
    await _db.collection('ProductReviews').doc(review.id).set(review.toJson());
  }

  Future<void> deleteReview(String reviewId) async {
    final authUserId = AuthenticationRepository.instance.authUser?.uid;
    if (authUserId == null || authUserId.isEmpty) {
      throw Exception('You must be signed in to delete a review.');
    }

    final doc = await _db.collection('ProductReviews').doc(reviewId).get();
    final data = doc.data();

    if (data == null) {
      throw Exception('Review not found.');
    }

    if (data['UserId']?.toString() != authUserId) {
      throw Exception('You can only delete your own review.');
    }

    await doc.reference.delete();
  }

  Stream<List<ReviewModel>> watchProductReviews(String productId) {
    return _db
        .collection('ProductReviews')
        .where('ProductId', isEqualTo: productId)
        .snapshots()
        .map((snapshot) {
          final reviews = snapshot.docs
              .map(ReviewModel.fromSnapshot)
              .where((review) => review.id.isNotEmpty)
              .toList();

          reviews.sort((a, b) => b.createdAt.compareTo(a.createdAt));
          return reviews;
        });
  }
}
