import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/usecases/get_properties.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetPropertiesUseCase getPropertiesUseCase;

  HomeCubit({required this.getPropertiesUseCase}) : super(HomeInitial());

  String selectedCategory = 'All';
  String selectedStatus = 'All';


void fetchProperties({String? category, String? status}) async {
  emit(HomeLoading());

  if (category == 'All') {
    selectedCategory = 'All';
    selectedStatus = 'All';
  } 
  else if (status != null) {
    selectedStatus = status;
    selectedCategory = 'All';
  } 
  else if (category != null) {
    selectedCategory = category;
    selectedStatus = 'All';
  }

  final result = await getPropertiesUseCase(
    category: selectedCategory == 'All' ? null : selectedCategory,
    status: selectedStatus == 'All' ? null : selectedStatus,
  );

  result.fold(
    (failure) => emit(HomeError(failure.message)),
    (properties) {
      final bestOffers = List<PropertyEntity>.from(properties)
        ..sort((a, b) => b.rating.compareTo(a.rating));

      final nearestProperties = List<PropertyEntity>.from(properties)
        ..sort((a, b) => a.distanceMiles.compareTo(b.distanceMiles));

      emit(HomeLoaded(
        bestOffers: bestOffers,
        nearestProperties: nearestProperties,
      ));
    },
  );
}

}