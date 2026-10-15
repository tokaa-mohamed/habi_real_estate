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
    final user = supabaseClient.auth.currentUser;
    if (user == null) {
      throw Exception('User session not found. Please log in again.');
    }

    final bookingData = bookingModel.toJson();
    bookingData['user_id'] = user.id; 
    
    await supabaseClient
        .from('bookings')
        .insert(bookingData);
  }
}