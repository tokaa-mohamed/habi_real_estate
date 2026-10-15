import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/payment_pages/data/datasource/booking_datasource.dart';
import 'package:real_estate/features/payment_pages/data/model/booking_model.dart';
import 'package:real_estate/features/payment_pages/domain/entity/booking_entites.dart';
import 'package:real_estate/features/payment_pages/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  BookingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> createBooking(BookingEntity booking) async {
    try {
      final bookingModel = BookingModel(
        propertyId: booking.propertyId,
        userId: booking.userId,
        bookingStatus: booking.bookingStatus,
        scheduledAt: booking.scheduledAt,
      );

      await remoteDataSource.createBooking(bookingModel);
      return const Right(null);
    } catch (e) {
      // Return a standard failure. You can check for PostgrestException for more specific errors.
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
