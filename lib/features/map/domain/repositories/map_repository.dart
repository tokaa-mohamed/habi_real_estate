import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/property_location_entity.dart';

abstract class MapRepository {
  Future<Either<Failure, List<PropertyLocationEntity>>> getPropertyLocations();
  Future<Either<Failure, PropertyLocationEntity>> getPropertyLocationById(int propertyId);
}
