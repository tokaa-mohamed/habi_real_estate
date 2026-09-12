import 'package:equatable/equatable.dart';

class PropertyLocationEntity extends Equatable {
  final int id;
  final String title;
  final String? description;
  final String location;
  final double price;
  final String priceUnit;
  final String category;
  final String status;
  final int bedrooms;
  final int bathrooms;
  final String mainImageUrl;
  final double rating;
  final double latitude;

  final double longitude;

  const PropertyLocationEntity({
    required this.id,
    required this.title,
    this.description,
    required this.location,
    required this.price,
    this.priceUnit = 'USD',
    this.category = 'House',
    this.status = 'For Sale',
    this.bedrooms = 0,
    this.bathrooms = 0,
    required this.mainImageUrl,
    this.rating = 0.0,
    required this.latitude,
    required this.longitude,
  });

  bool get hasValidCoordinates => latitude != 0.0 || longitude != 0.0;

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    location,
    price,
    priceUnit,
    category,
    status,
    bedrooms,
    bathrooms,
    mainImageUrl,
    rating,
    latitude,
    longitude,
  ];
}
