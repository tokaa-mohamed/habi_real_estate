import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/home/data/models/property_model.dart';

abstract class FavoritesRepository {
Future<Either<Failure, List<PropertyModel>>> getFavoriteProperties();
  
  Future<Either<Failure, void>> addToFavorites(int propertyId);
  Future<Either<Failure, void>> removeFromFavorites(int propertyId);  
  
  }