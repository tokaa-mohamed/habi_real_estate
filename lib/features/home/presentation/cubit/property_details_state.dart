
import 'package:equatable/equatable.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/entitties/review_entity.dart';


abstract class PropertyDetailsState extends Equatable {
  const PropertyDetailsState();

  @override
  List<Object?> get props => [];
}

class PropertyDetailsInitial extends PropertyDetailsState {}

class PropertyDetailsLoading extends PropertyDetailsState {}

class PropertyDetailsLoaded extends PropertyDetailsState {
  final PropertyEntity property;
  final List<ReviewEntity> reviews;
  final List<PropertyEntity> suggestedProperties; 
  
  PropertyDetailsLoaded({
    required this.property,
    required this.reviews,
    required this.suggestedProperties, 
      });

  @override
  List<Object?> get props => [property, reviews, suggestedProperties]; 
  
}
class PropertyDetailsError extends PropertyDetailsState {
  final String message;

  const PropertyDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}

