import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<Either<Failure, List<PropertyEntity>>> call() async {
    return await repository.getFavoriteProperties();
  }
}