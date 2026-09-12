import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';
import 'package:real_estate/features/profile_page/domain/repository/profile_page_repository.dart';

class UpdateProfileUseCase {
  final ProfileDataRepository repository;

  UpdateProfileUseCase({required this.repository});

  Future<Either<Failure, DataOfProfileEntity>> updateDataOfUser(
    String? full_name,
    String? location,
    String? avatar_url,
  ) async {
    return await repository.updateProfile(
      fullName: full_name,
      location: location,
      avatarUrl: avatar_url,
    );
  }
}
