import '../../domain/entities/property_location_entity.dart';

class PropertyLocationModel extends PropertyLocationEntity {
  const PropertyLocationModel({
    required super.id,
    required super.title,
    super.description,
    required super.location,
    required super.price,
    super.priceUnit,
    super.category,
    super.status,
    super.bedrooms,
    super.bathrooms,
    required super.mainImageUrl,
    super.rating,
    required super.latitude,
    required super.longitude,
  });

  factory PropertyLocationModel.fromJson(Map<String, dynamic> json) {
    return PropertyLocationModel(
      id: json['id'] is int ? json['id'] as int : int.tryParse(json['id'].toString()) ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      location: json['location'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      priceUnit: json['price_unit'] as String? ?? 'USD',
      category: json['category'] as String? ?? 'House',
      status: json['status'] as String? ?? 'For Sale',
      bedrooms: (json['bedrooms'] as num?)?.toInt() ?? 0,
      bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
      mainImageUrl: json['main_image_url'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['lat'] as num?)?.toDouble() ?? 30.0444,
      longitude: (json['long'] as num?)?.toDouble() ?? 31.2357,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'price': price,
      'price_unit': priceUnit,
      'category': category,
      'status': status,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'main_image_url': mainImageUrl,
      'rating': rating,
      'lat': latitude,
      'long': longitude,
    };
  }

  factory PropertyLocationModel.fromEntity(PropertyLocationEntity entity) {
    return PropertyLocationModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      location: entity.location,
      price: entity.price,
      priceUnit: entity.priceUnit,
      category: entity.category,
      status: entity.status,
      bedrooms: entity.bedrooms,
      bathrooms: entity.bathrooms,
      mainImageUrl: entity.mainImageUrl,
      rating: entity.rating,
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }
}
