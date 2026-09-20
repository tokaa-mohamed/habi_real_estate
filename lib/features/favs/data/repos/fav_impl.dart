import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/favs/data/datasources/datasource_fav.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';
import 'package:real_estate/features/home/data/models/property_model.dart'; 

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<PropertyModel>>> getFavoriteProperties() async {
    try {
      final List<PropertyModel> propertyModels = await remoteDataSource.getFavoriteProperties();
      
      return Right(propertyModels);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorites(int propertyId) async {
    try {
      await remoteDataSource.addToFavorites(propertyId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromFavorites(int propertyId) async {
    try {
      await remoteDataSource.removeFromFavorites(propertyId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}