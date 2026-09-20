import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/payment_pages/domain/entity/booking_entites.dart';

abstract class BookingRepository {
  Future<Either<Failure, void>> createBooking(BookingEntity booking);
}
