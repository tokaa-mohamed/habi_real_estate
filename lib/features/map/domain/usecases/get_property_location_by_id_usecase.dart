import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/property_location_entity.dart';
import '../repositories/map_repository.dart';

class GetPropertyLocationByIdUseCase {
  final MapRepository repository;

  GetPropertyLocationByIdUseCase(this.repository);

  Future<Either<Failure, PropertyLocationEntity>> call(int propertyId) async {
    return await repository.getPropertyLocationById(propertyId);
  }
}
