import 'package:real_estate/features/home/data/models/property_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FavoritesRemoteDataSource {
  Future<List<PropertyModel>> getFavoriteProperties();
  Future<void> addToFavorites(int propertyId);
  Future<void> removeFromFavorites(int propertyId);
}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final SupabaseClient supabaseClient;

  FavoritesRemoteDataSourceImpl(this.supabaseClient);

@override
Future<List<PropertyModel>> getFavoriteProperties() async {
  final userId = supabaseClient.auth.currentUser?.id;
  if (userId == null) throw Exception('User not logged in');

  final response = await supabaseClient
      .from('favorites')
      .select('property_id, properties(*)')
            .eq('user_id', userId);

  final List<dynamic> data = response;
  
  return data.map((item) {
    final propertyJson = item['properties'] as Map<String, dynamic>;
    return PropertyModel.fromJson(propertyJson);
  }).toList();
}

  @override
  Future<void> addToFavorites(int propertyId) async {
    final userId = supabaseClient.auth.currentUser?.id;
    if (userId == null) throw Exception('User not logged in');

try {
    await supabaseClient.from('favorites').insert({
      'user_id': userId,
      'property_id': propertyId,
    });
    print('🟢 [Supabase DS] Insert into Supabase SUCCESSFUL.');
  } catch (e) {
    print('❌ [Supabase DS] Insert into Supabase EXCEPTION: $e');
    rethrow;
  }
    }

  @override
  Future<void> removeFromFavorites(int propertyId) async {
    final userId = supabaseClient.auth.currentUser?.id;
    if (userId == null) throw Exception('User not logged in');

try {
    await supabaseClient.from('favorites')
        .delete()
        .eq('user_id', userId)
        .eq('property_id', propertyId);
    print('🟢 [Supabase DS] Delete from Supabase SUCCESSFUL.');
  } catch (e) {
    print('❌ [Supabase DS] Delete from Supabase EXCEPTION: $e');
    rethrow;
  }

  }
}