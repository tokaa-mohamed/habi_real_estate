import 'package:dartz/dartz.dart';
import '../../../../core/api/internet_connection_checker.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/property_location_entity.dart';
import '../../domain/repositories/map_repository.dart';
import '../datasources/map_remote_data_source.dart';

class MapRepositoryImpl implements MapRepository {
  final MapRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MapRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PropertyLocationEntity>>> getPropertyLocations() async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final models = await remoteDataSource.getPropertyLocations();
      return Right(models);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PropertyLocationEntity>> getPropertyLocationById(int propertyId) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure());
    }

    try {
      final model = await remoteDataSource.getPropertyLocationById(propertyId);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
