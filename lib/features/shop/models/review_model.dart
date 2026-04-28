import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String id;
  final String productId;
  final String userId;
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final DateTime createdAt;

  const ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  static ReviewModel empty() => ReviewModel(
    id: '',
    productId: '',
    userId: '',
    userName: '',
    userImage: '',
    rating: 0,
    comment: '',
    createdAt: DateTime.now(),
  );

  Map<String, Object?> toJson() {
    return {
      'ProductId': productId,
      'UserId': userId,
      'UserName': userName,
      'UserImage': userImage,
      'Rating': rating,
      'Comment': comment,
      'CreatedAt': Timestamp.fromDate(createdAt),
    };
  }

  factory ReviewModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();
    if (data == null) return ReviewModel.empty();

    final createdAtValue = data['CreatedAt'];
    final createdAt = createdAtValue is Timestamp
        ? createdAtValue.toDate()
        : DateTime.now();

    return ReviewModel(
      id: document.id,
      productId: data['ProductId']?.toString() ?? '',
      userId: data['UserId']?.toString() ?? '',
      userName: data['UserName']?.toString() ?? '',
      userImage: data['UserImage']?.toString() ?? '',
      rating: (data['Rating'] as num?)?.toDouble() ?? 0.0,
      comment: data['Comment']?.toString() ?? '',
      createdAt: createdAt,
    );
  }
}
