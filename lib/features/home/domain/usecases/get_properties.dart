import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/repos/home_repo.dart';

class GetPropertiesUseCase {
  final HomeRepository repository;

  GetPropertiesUseCase(this.repository);

  Future<Either<Failure, List<PropertyEntity>>> call({String? category, String? status}) async {
    return await repository.getProperties(category: category, status: status);
  }
}