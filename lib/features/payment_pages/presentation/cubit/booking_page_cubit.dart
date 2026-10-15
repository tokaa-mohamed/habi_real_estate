import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/features/payment_pages/domain/entity/booking_entites.dart';
import 'package:real_estate/features/payment_pages/domain/usecases/creating_booking_usecase.dart';
import 'package:real_estate/features/payment_pages/presentation/cubit/booking_page_state.dart';

class BookingCubit extends Cubit<BookingState> {
  final CreateBookingUseCase createBookingUseCase;

  BookingCubit({required this.createBookingUseCase}) : super(BookingInitial());

  Future<void> submitBooking({
    required int propertyId,
    required String userId,
    required DateTime scheduledAt,
    String bookingStatus = 'Pending', // Default status
  }) async {
    emit(BookingLoading());

    final booking = BookingEntity(
      propertyId: propertyId,
      userId: userId,
      bookingStatus: bookingStatus,
      scheduledAt: scheduledAt,
    );

    final result = await createBookingUseCase(booking);

    result.fold(
      (failure) => emit(
        BookingFailure(errorMessage: failure.message),
      ), // Adjust failure.message based on your Failure class
      (_) => emit(BookingSuccess()),
    );
  }
}
