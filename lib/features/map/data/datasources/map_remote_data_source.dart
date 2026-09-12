import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/property_location_model.dart';

abstract class MapRemoteDataSource {
  Future<List<PropertyLocationModel>> getPropertyLocations();
  Future<PropertyLocationModel> getPropertyLocationById(int propertyId);
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final SupabaseClient supabaseClient;

  MapRemoteDataSourceImpl({required this.supabaseClient});

  @override
  Future<List<PropertyLocationModel>> getPropertyLocations() async {
    final response = await supabaseClient
        .from('properties')
        .select('id, title, description, price, price_unit, location, main_image_url, lat, long, category, status, bedrooms, bathrooms, rating');

    final data = response as List<dynamic>;
    return data
        .map((e) => PropertyLocationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<PropertyLocationModel> getPropertyLocationById(int propertyId) async {
    final response = await supabaseClient
        .from('properties')
        .select('id, title, description, price, price_unit, location, main_image_url, lat, long, category, status, bedrooms, bathrooms, rating')
        .eq('id', propertyId)
        .single();

    return PropertyLocationModel.fromJson(response);
  }
}
