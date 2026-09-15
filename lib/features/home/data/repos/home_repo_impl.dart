import 'package:dartz/dartz.dart';
import 'package:real_estate/core/errors/failure.dart';
import 'package:real_estate/features/home/data/datasources/home-remote-datasource.dart';
import 'package:real_estate/features/home/domain/entitties/property_entity.dart';
import 'package:real_estate/features/home/domain/repos/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PropertyEntity>>> getProperties({String? category, String? status}) async {
    try {
      final propertyModels = await remoteDataSource.getProperties(category: category, status: status);
      
      final properties = propertyModels.map((model) => PropertyEntity(
        id: model.id,
        title: model.title,
        description: model.description ?? '',
        price: (model.price).toDouble(),
        priceUnit: model.priceUnit,
        location: model.location,
        distanceMiles: model.distanceMiles,
        category: model.category,
        status: model.status,
        bedrooms: model.bedrooms,
        bathrooms: model.bathrooms,
        kitchens: model.kitchens,
        garages: model.garages,
        livingRooms: model.livingRooms,
        rating: (model.rating).toDouble(),
        mediaUrl: model.mainImageUrl,
                reviewsCount: model.reviewsCount,
        imagesGallery: model.imagesGallery,
      )).toList();

      return Right(properties);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}