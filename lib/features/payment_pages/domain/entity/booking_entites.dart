import 'package:equatable/equatable.dart';

class BookingEntity extends Equatable {
  final int propertyId;
  final String userId;
  final String bookingStatus;
  final DateTime scheduledAt;

  const BookingEntity({
    required this.propertyId,
    required this.userId,
    required this.bookingStatus,
    required this.scheduledAt,
  });

  @override
  List<Object?> get props => [propertyId, userId, bookingStatus, scheduledAt];
}
