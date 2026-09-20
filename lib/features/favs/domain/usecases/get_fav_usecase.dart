import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';
import 'package:real_estate/features/home/data/models/property_model.dart'; // ⬅️ استبدلي الـ Entity بـ Model

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<Either<Failure, List<PropertyModel>>> call() async {
    return await repository.getFavoriteProperties();
  }
}