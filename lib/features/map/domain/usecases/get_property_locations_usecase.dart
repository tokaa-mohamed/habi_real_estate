import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/property_location_entity.dart';
import '../repositories/map_repository.dart';

class GetPropertyLocationsUseCase {
  final MapRepository repository;

  GetPropertyLocationsUseCase(this.repository);

  Future<Either<Failure, List<PropertyLocationEntity>>> call() async {
    return await repository.getPropertyLocations();
  }
}
