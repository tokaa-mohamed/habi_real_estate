import 'package:real_estate/features/payment_pages/domain/entity/booking_entites.dart';

class BookingModel extends BookingEntity {
  const BookingModel({
    required super.propertyId,
    required super.userId,
    required super.bookingStatus,
    required super.scheduledAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'property_id': propertyId,
      'user_id': userId,
      'booking_status': bookingStatus,
      'scheduled_at': scheduledAt.toIso8601String(), // timestamptz format
    };
  }
}
