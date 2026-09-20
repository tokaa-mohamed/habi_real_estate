import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:real_estate/features/favs/data/datasources/datasource_fav.dart';
import 'package:real_estate/features/favs/data/repos/fav_impl.dart';
import 'package:real_estate/features/favs/domain/repos/fav_repo.dart';
import 'package:real_estate/features/favs/domain/usecases/add_fav_usecase.dart';
import 'package:real_estate/features/favs/domain/usecases/get_fav_usecase.dart';
import 'package:real_estate/features/favs/domain/usecases/remove_usecase.dart';
import 'package:real_estate/features/favs/presentation/cubit/fav_cubit.dart';
import 'package:real_estate/features/map/data/datasources/map_remote_data_source.dart';
import 'package:real_estate/features/map/data/repositories/map_repository_impl.dart';
import 'package:real_estate/features/map/domain/repositories/map_repository.dart';
import 'package:real_estate/features/map/domain/usecases/get_property_usecase.dart';
import 'package:real_estate/features/map/presentation/cubit/map_cubit.dart';
import 'package:real_estate/features/payment_pages/data/datasource/booking_datasource.dart';
import 'package:real_estate/features/payment_pages/data/repository/booking_repository_impl.dart';
import 'package:real_estate/features/payment_pages/domain/repository/booking_repository.dart';
import 'package:real_estate/features/payment_pages/domain/usecases/creating_booking_usecase.dart';
import 'package:real_estate/features/payment_pages/presentation/cubit/booking_page_cubit.dart';
import 'package:real_estate/features/profile_page/data/datasource/profile_datasource.dart';
import 'package:real_estate/features/profile_page/data/repositories/profile_data_repository_impl.dart';
import 'package:real_estate/features/profile_page/domain/repository/profile_page_repository.dart';
import 'package:real_estate/features/profile_page/domain/usecases/get_profile_data_usecase.dart';
import 'package:real_estate/features/profile_page/domain/usecases/update_profile_data_usecase.dart';
import 'package:real_estate/features/profile_page/presentation/cubit/profile_page_cubit.dart';
import 'package:real_estate/features/home/data/datasources/home-remote-datasource.dart';
import 'package:real_estate/features/home/data/repos/home_repo_impl.dart';
import 'package:real_estate/features/home/data/repos/property_repo_impl.dart';
import 'package:real_estate/features/home/domain/repos/home_repo.dart';
import 'package:real_estate/features/home/domain/repos/property_repo.dart';
import 'package:real_estate/features/home/domain/usecases/get_properties.dart';
import 'package:real_estate/features/home/domain/usecases/get_property_details.dart';
import 'package:real_estate/features/home/presentation/cubit/home_cubit.dart';
import 'package:real_estate/features/home/presentation/cubit/property_details_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constant/app_constants.dart';
import 'routes/app_router.dart';
import 'save data/save_data.dart';
import 'security/security_helper.dart';
import 'api/dio_helper.dart';
import 'api/internet_connection_checker.dart';
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../features/auth/domain/usecases/login_usecase.dart';
import '../features/auth/domain/usecases/logout_usecase.dart';
import '../features/auth/domain/usecases/reset_password_usecase.dart';
import '../features/auth/domain/usecases/signup_usecase.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initAppModule() async {

if (kIsWeb) {
  getIt.registerLazySingleton<NetworkInfo>(() => WebNetworkInfo());
} else {
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );
}

  getIt.registerSingleton<AppRouter>(AppRouter());

  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    publishableKey: AppConstants.supabaseAnonKey,
  );
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  final cacheHelper = CacheHelper();
  await cacheHelper.init();
  getIt.registerLazySingleton<CacheHelper>(() => cacheHelper);

  final securityHelper = SecurityHelper();
  getIt.registerLazySingleton<SecurityHelper>(() => securityHelper);

  final authStorage = AuthStorage(getIt<SecurityHelper>());
  await authStorage.migrateFromCacheIfNeeded(cacheHelper);
  await authStorage.loadFromSecure();
  getIt.registerLazySingleton<AuthStorage>(() => authStorage);

  await DioHelper.init();
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());

  // 1. Auth Module
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(supabaseClient: getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  getIt.registerLazySingleton(() => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => SignUpUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => GetCurrentUserUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(() => ResetPasswordUseCase(getIt<AuthRepository>()));

  getIt.registerFactory(
    () => AuthCubit(
      loginUseCase: getIt<LoginUseCase>(),
      signUpUseCase: getIt<SignUpUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCase>(),
      resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
    ),
  );

  // 2. Profile Module
  getIt.registerLazySingleton<ProfileDatasource>(
    () => ProfileDatasource(supabase: getIt()),
  );

  getIt.registerLazySingleton<ProfileDataRepository>(
    () => ProfileDataRepositoryImpl(networkInfo: getIt(), datasource: getIt()),
  );

  getIt.registerLazySingleton(
    () => GetProfileDataUsecase(repository: getIt<ProfileDataRepository>()),
  );
  getIt.registerLazySingleton(
    () => UpdateProfileUseCase(repository: getIt<ProfileDataRepository>()),
  );

  getIt.registerFactory<ProfilePageCubit>(
    () => ProfilePageCubit(
      getProfileDataUsecase: getIt<GetProfileDataUsecase>(),
      updateProfileUseCase: getIt<UpdateProfileUseCase>(),
    ),
  );

getIt.registerLazySingleton<MapRemoteDataSource>(
    () => MapRemoteDataSourceImpl(supabaseClient: getIt<SupabaseClient>()),
  );
  

 getIt.registerLazySingleton<MapRepository>(
    () => MapRepositoryImpl(
      remoteDataSource: getIt<MapRemoteDataSource>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetPropertyLocationsUseCase(getIt<MapRepository>()), 
      );

  getIt.registerFactory(
    () => MapCubit(
      getPropertyLocationsUseCase: getIt<GetPropertyLocationsUseCase>(),
    ),
  );
  // 3. Booking Module (Payment)
  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSourceImpl(supabaseClient: getIt()),
  );

  getIt.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => CreateBookingUseCase(getIt()));

  getIt.registerFactory<BookingCubit>(
    () => BookingCubit(createBookingUseCase: getIt()),
  );

  // 4. Home & Property Module
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(supabaseClient: getIt()),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => GetPropertiesUseCase(getIt()));

  getIt.registerFactory(() => HomeCubit(getPropertiesUseCase: getIt()));

  getIt.registerLazySingleton<PropertyDetailsRepository>(
    () => PropertyDetailsRepositoryImpl(getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton(
    () => GetPropertyDetailsUseCase(getIt<PropertyDetailsRepository>()),
  );

  getIt.registerFactory(
    () => PropertyDetailsCubit(
      getPropertyDetailsUseCase: getIt<GetPropertyDetailsUseCase>(),
      propertyDetailsRepository: getIt<PropertyDetailsRepository>(),
    ),
  );


 getIt.registerLazySingleton<FavoritesRemoteDataSource>(
  () => FavoritesRemoteDataSourceImpl(getIt<SupabaseClient>()),
);

// 2. Repository
getIt.registerLazySingleton<FavoritesRepository>(
  () => FavoritesRepositoryImpl(getIt<FavoritesRemoteDataSource>()),
);

getIt.registerLazySingleton(() => GetFavoritesUseCase(getIt<FavoritesRepository>()));
getIt.registerLazySingleton(() => AddToFavoritesUseCase(getIt<FavoritesRepository>()));
getIt.registerLazySingleton(() => RemoveFromFavoritesUseCase(getIt<FavoritesRepository>()));

getIt.registerLazySingleton(() => FavoritesCubit(
  getIt<GetFavoritesUseCase>(),
  getIt<AddToFavoritesUseCase>(),
  getIt<RemoveFromFavoritesUseCase>(),
));
}