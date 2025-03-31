import 'package:get_it/get_it.dart';

import 'package:asood/core/constants/endpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/features/auth/data/data_source/auth_api_service.dart';
import 'package:asood/features/auth/data/repository/auth_repository_imp.dart';
import 'package:asood/features/auth/domain/repository/auth_repository.dart';
import 'package:asood/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:asood/features/splash/blocs/splash_bloc.dart';

GetIt locator = GetIt.instance;

locatorSetup() async {
  /// Dio client
  locator.registerLazySingleton<DioClient>(
    () => DioClient(appBaseUrl: Endpoints.baseUrl),
  );

  /// Api Services
  locator.registerFactory(
    () => AuthApiService(dioClient: locator<DioClient>()),
  );

  /// Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(locator<AuthApiService>()),
  );

  /// BLOCs
  /// splash
  locator.registerFactory(() => SplashBloc());

  /// auth
  locator.registerFactory(
    () => AuthBloc(authRepository: locator<AuthRepository>()),
  );
}
