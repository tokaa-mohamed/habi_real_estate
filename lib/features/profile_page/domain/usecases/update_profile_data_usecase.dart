import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';
import 'package:real_estate/features/profile_page/domain/repository/profile_page_repository.dart';

class UpdateProfileParams {
  final String? fullName;
  final String? location;
  final String? avatarUrl;

  const UpdateProfileParams({this.fullName, this.location, this.avatarUrl});
}

class UpdateProfileUseCase {
  final ProfileDataRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, DataOfProfileEntity>> call(
    UpdateProfileParams params,
  ) async {
    return await repository.updateProfile(
      fullName: params.fullName,
      location: params.location,
      avatarUrl: params.avatarUrl,
    );
  }
}
