import 'package:equatable/equatable.dart';

class PropertyEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String priceUnit;
  final String location;
  final int distanceMiles;
  final String category;
  final String status;
  final int bedrooms;
  final int bathrooms;
  final int kitchens;
  final int garages;
  final int livingRooms;
  final double rating;
  final String mediaUrl;
  final int reviewsCount;
  final List<String> imagesGallery;

  final String? front360Url;
  final String? back360Url;
  final String? side360Url;
final String? livingRoom360Url;
  final String? kitchen360Url;
  final String? bedroom360Url;
  final String? bathroom360Url;

  final double? latitude;
  final double? longitude;
  final String? agentName;
  final String? agentPhone;
  final String? agentImage;
  final String? agentRole;

  const PropertyEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.priceUnit,
    required this.location,
    required this.distanceMiles,
    required this.category,
    required this.status,
    required this.bedrooms,
    required this.bathrooms,
    required this.kitchens,
    required this.garages,
    required this.livingRooms,
    required this.rating,
    required this.mediaUrl,
    required this.reviewsCount,
    required this.imagesGallery,
    this.front360Url,
    this.back360Url,
    this.side360Url,
    this.livingRoom360Url,
    this.kitchen360Url,
    this.bedroom360Url,
    this.bathroom360Url,
    this.latitude,
    this.longitude,
    this.agentName,
    this.agentPhone,
    this.agentImage,
    this.agentRole,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        price,
        priceUnit,
        location,
        distanceMiles,
        category,
        status,
        bedrooms,
        bathrooms,
        kitchens,
        garages,
        livingRooms,
        rating,
        mediaUrl,
        reviewsCount,
        imagesGallery,
      ];
}