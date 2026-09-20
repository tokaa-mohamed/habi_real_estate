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
    final id = json["id"];
    final updated_at = json["updated_at"];
    return ProfileDataModel(
      full_name: json["full_name"],
      email: json["email"],
      location: json["location"],
      avatar_url: json["avatar_url"],
      created_at: DateTime.parse(json["created_at"]),
      id: id,
      updated_at: DateTime.parse(updated_at),
    );
  }
  toJson() {
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
