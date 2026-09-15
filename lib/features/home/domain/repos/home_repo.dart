import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PropertyEntity>>> getProperties({String? category, String? status});
}