import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';
import 'package:real_estate/features/profile_page/domain/repository/profile_page_repository.dart';

class GetProfileDataUsecase {
  final ProfileDataRepository repository;

  GetProfileDataUsecase({required this.repository});
  Future<Either<Failure, DataOfProfileEntity>> readProfileData() async {
    return await repository.getProfileData();
  }
}
