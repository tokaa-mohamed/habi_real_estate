import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/payment_pages/domain/entity/booking_entites.dart';
import 'package:real_estate/features/payment_pages/domain/repository/booking_repository.dart';

class CreateBookingUseCase {
  final BookingRepository repository;

  CreateBookingUseCase(this.repository);

  Future<Either<Failure, void>> call(BookingEntity booking) async {
    return await repository.createBooking(booking);
  }
}
