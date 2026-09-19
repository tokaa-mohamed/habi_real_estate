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

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );

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
