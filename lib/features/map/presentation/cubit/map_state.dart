import 'package:equatable/equatable.dart';
import '../../domain/entities/property_location_entity.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object?> get props => [];
}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final List<PropertyLocationEntity> properties;
  final PropertyLocationEntity? selectedProperty;

  const MapLoaded({
    required this.properties,
    this.selectedProperty,
  });

  MapLoaded copyWith({
    List<PropertyLocationEntity>? properties,
    PropertyLocationEntity? selectedProperty,
    bool clearSelected = false,
  }) {
    return MapLoaded(
      properties: properties ?? this.properties,
      selectedProperty: clearSelected ? null : (selectedProperty ?? this.selectedProperty),
    );
  }

  @override
  List<Object?> get props => [properties, selectedProperty];
}

class MapError extends MapState {
  final String message;

  const MapError(this.message);

  @override
  List<Object?> get props => [message];
}
