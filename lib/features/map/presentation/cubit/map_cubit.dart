import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/property_location_entity.dart';
import '../../domain/usecases/get_property_locations_usecase.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final GetPropertyLocationsUseCase getPropertyLocationsUseCase;

  MapCubit({
    required this.getPropertyLocationsUseCase,
  }) : super(MapInitial());

  Future<void> fetchPropertyLocations({PropertyLocationEntity? initialSelectedProperty}) async {
    emit(MapLoading());
    final result = await getPropertyLocationsUseCase();
    result.fold(
      (failure) => emit(MapError(failure.message)),
      (properties) {
        PropertyLocationEntity? selected = initialSelectedProperty;
        if (selected == null && properties.isNotEmpty) {
          selected = properties.first;
        }
        emit(MapLoaded(
          properties: properties,
          selectedProperty: selected,
        ));
      },
    );
  }

  void setSingleProperty(PropertyLocationEntity property) {
    emit(MapLoaded(
      properties: [property],
      selectedProperty: property,
    ));
  }

  void selectProperty(PropertyLocationEntity property) {
    final currentState = state;
    if (currentState is MapLoaded) {
      emit(currentState.copyWith(selectedProperty: property));
    } else {
      emit(MapLoaded(properties: [property], selectedProperty: property));
    }
  }

  void clearSelectedProperty() {
    final currentState = state;
    if (currentState is MapLoaded) {
      emit(currentState.copyWith(clearSelected: true));
    }
  }
}
