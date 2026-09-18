import 'package:real_estate/features/payment_pages/data/model/booking_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BookingRemoteDataSource {
  Future<void> createBooking(BookingModel bookingModel);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final SupabaseClient supabaseClient;

  BookingRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<void> createBooking(BookingModel bookingModel) async {
    final response = await supabaseClient
        .from('bookings')
        .insert(bookingModel.toJson());

    // Supabase throws a PostgrestException if the insert fails,
    // which will be caught by the repository block.
  }
}
