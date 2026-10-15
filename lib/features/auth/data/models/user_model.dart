import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.fullName,
    super.avatarUrl,
    super.createdAt,
  });

  factory UserModel.fromSupabaseUser(
    User user, {
    Map<String, dynamic>? profileData,
  }) {
    final metaData = user.userMetadata;

    return UserModel(
      id: user.id,
      email: user.email ?? '',
      fullName:
          profileData?['full_name'] as String? ??
          metaData?['full_name'] as String?,
      avatarUrl:
          profileData?['avatar_url'] as String? ??
          metaData?['avatar_url'] as String?,
      createdAt: DateTime.parse(user.createdAt),
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String? ?? '',
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'avatar_url': avatarUrl,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
