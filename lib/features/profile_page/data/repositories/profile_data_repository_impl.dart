import 'package:dartz/dartz.dart';
import 'package:real_estate/core/api/internet_connection_checker.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/profile_page/data/datasource/profile_datasource.dart';
import 'package:real_estate/features/profile_page/domain/entites/profle_page_data.dart';
import 'package:real_estate/features/profile_page/domain/repository/profile_page_repository.dart';

class ProfileDataRepositoryImpl extends ProfileDataRepository {
  final NetworkInfo networkInfo;
  final ProfileDatasource datasource;

  ProfileDataRepositoryImpl({
    required this.networkInfo,
    required this.datasource,
  });
  @override
  Future<Either<Failure, DataOfProfileEntity>> getProfileData() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await datasource.readProfileData();
        return Right(response);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, DataOfProfileEntity>> updateProfile({
    String? fullName,
    String? location,
    String? avatarUrl,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await datasource.updateProfile(
          fullName,
          location,
          avatarUrl,
        );
        return Right(response);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: "No internet connection"));
    }
  }
}
