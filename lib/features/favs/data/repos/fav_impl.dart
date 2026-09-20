import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/favs/data/datasources/datasource_fav.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl(this.remoteDataSource);

@override
Future<Either<Failure, List<PropertyEntity>>> getFavoriteProperties() async {
  try {
    final propertyModels = await remoteDataSource.getFavoriteProperties();
    
    final List<PropertyEntity> properties = propertyModels
        .map((model) => model as PropertyEntity) 
      
        .toList();
    
    return Right(properties);
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