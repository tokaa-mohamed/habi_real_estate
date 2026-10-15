import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';

class AddToFavoritesUseCase {
  final FavoritesRepository repository;

  AddToFavoritesUseCase(this.repository);

  Future<Either<Failure, void>> call(int propertyId) async {
    return await repository.addToFavorites(propertyId);
  }
}