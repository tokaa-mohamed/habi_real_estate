import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/property_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<PropertyModel>> getProperties({String? category, String? status});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient supabaseClient;

  HomeRemoteDataSourceImpl({required this.supabaseClient});

@override
  Future<List<PropertyModel>> getProperties({String? category, String? status}) async {
var query = supabaseClient.from('properties').select('*, property_media(media_url)');    
    if (category != null && category != 'All') {
      query = query.eq('category', category);
    }
    if (status != null && status != 'All') {
      query = query.eq('status', status);
    }

    final response = await query;
    
    print('RAW SUPABASE RESPONSE: $response');

return (response as List).map((json) {
    var modifiedJson = Map<String, dynamic>.from(json);
    
    final mediaList = json['property_media'] as List?;
    if (mediaList != null && mediaList.isNotEmpty) {
      modifiedJson['media_url'] = mediaList[0]['media_url'] ?? '';
    } else {
      modifiedJson['media_url'] = '';
    }
    
    return PropertyModel.fromJson(modifiedJson);
  }).toList();
  
    }
  }