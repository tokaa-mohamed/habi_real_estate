import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart'; 

abstract class FavoritesRepository {
  Future<Either<Failure, List<PropertyEntity>>> getFavoriteProperties();
Future<Either<Failure, void>> addToFavorites(int propertyId);
  Future<Either<Failure, void>> removeFromFavorites(int propertyId);  
}