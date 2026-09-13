class PropertyModel {
  final int id;
  final String title;
  final String? description;
  final num price;
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
  final String mainImageUrl; 
  final int? sqft;
  final num rating;
  final int reviewsCount;
  final List<String> imagesGallery; 

  // حقول الـ 360 الجديدة
  final String? front360Url;
  final String? back360Url;
  final String? side360Url;
  final String? livingRoom360Url;
  final String? kitchen360Url;
  final String? bedroom360Url;
  final String? bathroom360Url;

  PropertyModel({
    required this.id,
    required this.title,
    this.description,
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
    required this.mainImageUrl,
    this.sqft,
    required this.rating,
    required this.reviewsCount,
    required this.imagesGallery,
    this.front360Url,
    this.back360Url,
    this.side360Url,
    this.livingRoom360Url,
    this.kitchen360Url,
    this.bedroom360Url,
    this.bathroom360Url,
  });
factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'],
      price: json['price'] ?? 0,
      priceUnit: json['price_unit'] ?? '',
      location: json['location'] ?? '',
      distanceMiles: json['distance_miles'] ?? 0,
      category: json['category'] ?? '',
      status: json['status'] ?? '',
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      kitchens: json['kitchens'] ?? 0,
      garages: json['garages'] ?? 0,
      livingRooms: json['living_rooms'] ?? 0,
      mainImageUrl: json['main_image_url'] ?? '',
      sqft: json['sqft'],
      rating: json['rating'] ?? 0,
      reviewsCount: json['reviews_count'] ?? 0,
      imagesGallery: List<String>.from(json['images_gallery'] ?? []),
      
      // قراءة الصور من الأعمدة المباشرة في Supabase مع وضع الـ mainImageUrl كبديل (Fallback) لو الصورة فاضية
      front360Url: json['front_image_url'] ?? json['main_image_url'],
      back360Url: json['back_image_url'] ?? json['main_image_url'],
      side360Url: json['side_image_url'] ?? json['main_image_url'],
      livingRoom360Url: json['living_room_image_url'] ?? json['main_image_url'],
      kitchen360Url: json['kitchen_image_url'] ?? json['main_image_url'],
      bedroom360Url: json['bedroom_image_url'] ?? json['main_image_url'],
      bathroom360Url: json['outdoor_image_url'] ?? json['main_image_url'],
    );
  }
}