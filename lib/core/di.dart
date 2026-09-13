import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
import 'save data/save_data.dart';
import 'security/security_helper.dart';
import 'api/dio_helper.dart';
import 'api/internet_connection_checker.dart';

final GetIt getIt = GetIt.instance;


Future<void> initAppModule() async {
  // 1. Initialize Supabase SDK
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    publishableKey: AppConstants.supabaseAnonKey,
  );
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // 2. Cache & Security Helpers
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

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );


  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(supabaseClient: getIt()),
  );

  // 3. Repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt()),
  );

  // 4. Use Cases
  getIt.registerLazySingleton(() => GetPropertiesUseCase(getIt()));

  getIt.registerFactory(() => HomeCubit(getPropertiesUseCase: getIt()));


getIt.registerLazySingleton<PropertyDetailsRepository>(
    () => PropertyDetailsRepositoryImpl(getIt<SupabaseClient>()),
  );

  getIt.registerLazySingleton(() => GetPropertyDetailsUseCase(getIt<PropertyDetailsRepository>()));

  // 3. Cubit
getIt.registerFactory(() => PropertyDetailsCubit(
        getPropertyDetailsUseCase: getIt<GetPropertyDetailsUseCase>(),
        propertyDetailsRepository: getIt<PropertyDetailsRepository>(), 
              ));

}
