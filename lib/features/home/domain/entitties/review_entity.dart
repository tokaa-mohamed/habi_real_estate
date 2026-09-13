import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final int id;
  final int propertyId;
  final String userId;
  final String userName;
  final int rating;
  final String? commentTitle;
  final String? comment;
  final int helpfulCount;
  final DateTime createdAt;
  final String? userAvatar;
  const ReviewEntity({
    required this.id,
    required this.propertyId,
    required this.userId,
    required this.userName,
    required this.rating,
    this.commentTitle,
    this.comment,
    required this.helpfulCount,
    required this.createdAt,
    this.userAvatar,
  });

  @override
  List<Object?> get props => [
        id,
        propertyId,
        userId,
        userName,
        rating,
        commentTitle,
        comment,
        helpfulCount,
        createdAt,
      ];
}