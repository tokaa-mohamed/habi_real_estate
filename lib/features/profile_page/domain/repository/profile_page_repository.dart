import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';

abstract class ProfileDataRepository {
  Future<Either<Failure, DataOfProfileEntity>> getProfileData();
  Future<Either<Failure, DataOfProfileEntity>> updateProfile({
    String? fullName,
    String? location,
    String? avatarUrl,
  });
}
