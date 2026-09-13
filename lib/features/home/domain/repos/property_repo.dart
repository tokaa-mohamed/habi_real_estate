import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/entitties/review_entity.dart';

abstract class PropertyDetailsRepository {
  Future<PropertyEntity> getPropertyDetails(int propertyId);
  Future<List<ReviewEntity>> getPropertyReviews(int propertyId);

  Future<List<PropertyEntity>> getSuggestedProperties({
    required int currentPropertyId,
    required String currentLocation,
  });
}