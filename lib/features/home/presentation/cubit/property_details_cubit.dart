import 'package:bloc/bloc.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/entitties/review_entity.dart';
import 'package:real_estate/features/home/domain/repos/property_repo.dart'; 
import 'package:real_estate/features/home/domain/usecases/get_property_details.dart';
import 'package:real_estate/features/home/presentation/cubit/property_details_state.dart';

class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
  final GetPropertyDetailsUseCase getPropertyDetailsUseCase;
  final PropertyDetailsRepository propertyDetailsRepository; 

  PropertyDetailsCubit({
    required this.getPropertyDetailsUseCase,
    required this.propertyDetailsRepository,
  }) : super(PropertyDetailsInitial());

Future<void> fetchPropertyDetails(int propertyId) async {
  emit(PropertyDetailsLoading());
  try {
    final property = await getPropertyDetailsUseCase(propertyId);

    final results = await Future.wait([
      propertyDetailsRepository.getPropertyReviews(propertyId),
      propertyDetailsRepository.getSuggestedProperties(
        currentPropertyId: property.id,
        currentLocation: property.location,
      ),
    ]);

    final reviews = results[0] as List<ReviewEntity>;
    final suggestedProperties = results[1] as List<PropertyEntity>; 
    
    emit(PropertyDetailsLoaded(
      property: property, 
      reviews: reviews,
      suggestedProperties: suggestedProperties,
    ));
  } catch (e) {
    emit(PropertyDetailsError(message: e.toString()));
  }
}
}