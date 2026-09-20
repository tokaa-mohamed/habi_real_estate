import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/features/favs/domain/usecases/add_fav_usecase.dart';
import 'package:real_estate/features/favs/domain/usecases/get_fav_usecase.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddToFavoritesUseCase addToFavoritesUseCase;

  FavoritesCubit(this.getFavoritesUseCase, this.addToFavoritesUseCase) 
      : super(FavoritesInitial());

  void fetchFavorites() async {
    emit(FavoritesLoading());
    final result = await getFavoritesUseCase();
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (properties) => emit(FavoritesLoaded(properties)),
    );
  }

  void toggleFavorite(int propertyId) async {
    final result = await addToFavoritesUseCase(propertyId);
    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (_) {
        fetchFavorites();
      },
    );
  }
}