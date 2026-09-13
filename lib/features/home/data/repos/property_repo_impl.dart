import 'package:real_estate/features/home/data/models/property_model.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/entitties/review_entity.dart';
import 'package:real_estate/features/home/domain/repos/property_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PropertyDetailsRepositoryImpl implements PropertyDetailsRepository {
  final SupabaseClient supabaseClient;

  PropertyDetailsRepositoryImpl(this.supabaseClient);

@override
  Future<PropertyEntity> getPropertyDetails(int propertyId) async {
    final response = await supabaseClient
        .from('properties')
        .select('*, reviews(*)') // شلنا property_360_views خالص من هنا
        .eq('id', propertyId)
        .single();

    final model = PropertyModel.fromJson(response);

    return PropertyEntity(
      id: model.id,
      title: model.title,
      description: model.description ?? '',
      price: model.price.toDouble(),
      priceUnit: model.priceUnit,
      location: model.location,
      distanceMiles: model.distanceMiles,
      category: model.category,
      status: model.status,
      bedrooms: model.bedrooms,
      bathrooms: model.bathrooms,
      kitchens: model.kitchens,
      garages: model.garages,
      livingRooms: model.livingRooms,
      rating: model.rating.toDouble(),
      mediaUrl: model.mainImageUrl,
      reviewsCount: model.reviewsCount,
      imagesGallery: model.imagesGallery,
      
      front360Url: model.front360Url,
      back360Url: model.back360Url,
      side360Url: model.side360Url,
      livingRoom360Url: model.livingRoom360Url,
      kitchen360Url: model.kitchen360Url,
      bedroom360Url: model.bedroom360Url,
      bathroom360Url: model.bathroom360Url,
    );
  }
  
@override
Future<List<PropertyEntity>> getSuggestedProperties({
  required int currentPropertyId,
  required String currentLocation,
}) async {
  final response = await supabaseClient
      .from('properties')
      .select('*, property_360_views(*), reviews(*)')
      .neq('id', currentPropertyId)
      .neq('location', currentLocation)
      .limit(10);

  // 1. بنحول الـ JSON لـ PropertyModel
  final models = (response as List)
      .map((json) => PropertyModel.fromJson(json))
      .toList();

  return models.map((model) => PropertyEntity(
    id: model.id,
    title: model.title,
    description: model.description ?? '',
    price: model.price.toDouble(),
    priceUnit: model.priceUnit,
    location: model.location,
    distanceMiles: model.distanceMiles,
    category: model.category,
    status: model.status,
    bedrooms: model.bedrooms,
    bathrooms: model.bathrooms,
    kitchens: model.kitchens,
    garages: model.garages,
    livingRooms: model.livingRooms,
    rating: model.rating.toDouble(),
    mediaUrl: model.mainImageUrl,
    reviewsCount: model.reviewsCount,
    imagesGallery: model.imagesGallery,
  )).toList();
}

  @override
  Future<List<ReviewEntity>> getPropertyReviews(int propertyId) async {
    final response = await supabaseClient
        .from('reviews')
        .select()
        .eq('property_id', propertyId);

    print('>>> REVIEWS FETCHED FROM SUPABASE: $response');
    
    return (response as List).map((item) {
return ReviewEntity(
  id: item['id'],
  propertyId: item['property_id'], 
  userId: item['user_id'] ?? '', 
  userName: item['user_name'] ?? 'Anonymous',
  userAvatar: item['user_avatar'], 
  rating: item['rating'] ?? 0,
  commentTitle: item['comment_title'], 
  comment: item['comment'] ?? '',
  helpfulCount: item['helpful_count'] ?? 0, 
  createdAt: item['created_at'] != null 
      ? DateTime.parse(item['created_at']) 
      : DateTime.now(), 
);    }).toList();
  }
}