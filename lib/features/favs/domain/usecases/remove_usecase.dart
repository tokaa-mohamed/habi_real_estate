import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';

class RemoveFromFavoritesUseCase {
  final FavoritesRepository repository;

  RemoveFromFavoritesUseCase(this.repository);

  Future<Either<Failure, void>> call(int propertyId) async {
    return await repository.removeFromFavorites(propertyId);
  }
}