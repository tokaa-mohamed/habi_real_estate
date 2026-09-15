import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/repos/property_repo.dart';

class GetPropertyDetailsUseCase {
  final PropertyDetailsRepository repository;

  GetPropertyDetailsUseCase(this.repository);

  Future<PropertyEntity> call(int propertyId) async {
    return await repository.getPropertyDetails(propertyId);
  }
}