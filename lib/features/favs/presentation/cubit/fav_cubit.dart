import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/features/favs/domain/usecases/add_fav_usecase.dart';
import 'package:real_estate/features/favs/domain/usecases/get_fav_usecase.dart';
import 'package:real_estate/features/favs/domain/usecases/remove_usecase.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_state.dart';
import 'package:real_estate/features/home/data/models/property_model.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final AddToFavoritesUseCase addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase removeFromFavoritesUseCase; 
  
  FavoritesCubit(
    this.getFavoritesUseCase,
    this.addToFavoritesUseCase,
    this.removeFromFavoritesUseCase, 
  ) : super(FavoritesInitial());

  void fetchFavorites({bool showLoading = true}) async {
    if (showLoading) {
      if (!isClosed) emit(FavoritesLoading());
    }
    
    final result = await getFavoritesUseCase();
    
    if (isClosed) return; 
    
    result.fold(
      (failure) {
        if (!isClosed) emit(FavoritesError(failure.message));
      },
      (properties) {
        if (!isClosed) emit(FavoritesLoaded(properties));
      },
    );
  }

void toggleFavorite({required PropertyModel property, required bool isFavorite}) async {
  print('🟡 [FAV CUBIT] -> toggleFavorite called for propertyId: ${property.id}, wasFavorite: $isFavorite');

  final currentState = state;
  List<PropertyModel> previousFavorites = [];
  
  if (currentState is FavoritesLoaded) {
    previousFavorites = List.from(currentState.favorites);
  }

  List<PropertyModel> updatedList = List.from(previousFavorites);

  if (isFavorite) {
    updatedList.removeWhere((p) => p.id.toString() == property.id.toString());
  } else {
    if (!updatedList.any((p) => p.id.toString() == property.id.toString())) {
      updatedList.add(property);
    }
  }
  
  if (!isClosed) {
    emit(FavoritesLoaded(updatedList));
  }

  final result = isFavorite 
      ? await removeFromFavoritesUseCase(property.id)
      : await addToFavoritesUseCase(property.id);

  if (isClosed) return; 

  result.fold(
    (failure) {
      print('❌ [FAV CUBIT] -> toggleFavorite FAILED: ${failure.message}');
      if (!isClosed) {
        emit(FavoritesLoaded(previousFavorites));
      }
    },
    (_) {
      print('✅ [FAV CUBIT] -> toggleFavorite SUCCESS!');
      fetchFavorites(showLoading: false); 
    },
  );
}
  }