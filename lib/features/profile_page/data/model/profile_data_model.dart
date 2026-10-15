import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';

class ProfileDataModel extends DataOfProfileEntity {
  final String id;
  final DateTime updated_at;

  ProfileDataModel({
    required super.full_name,
    required super.email,
    required super.location,
    required super.avatar_url,
    required super.created_at,
    required this.id,
    required this.updated_at,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      full_name: json["full_name"]?.toString() ?? '',
      email: json["email"]?.toString() ?? '',
      location: json["location"]?.toString() ?? 'Not specified',
      avatar_url: json["avatar_url"]?.toString() ?? '',
      
      created_at: json["created_at"] != null 
          ? DateTime.parse(json["created_at"]) 
          : DateTime.now(),
          
      id: json["id"]?.toString() ?? '',
      
      updated_at: json["updated_at"] != null 
          ? DateTime.parse(json["updated_at"]) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "full_name": full_name,
      "email": email,
      "location": location,
      "avatar_url": avatar_url,
      "created_at": created_at.toIso8601String(),
      "id": id,
      "updated_at": updated_at.toIso8601String(),
    };
  }
}