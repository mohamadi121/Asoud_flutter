import 'package:asood/features/job_managment/data/data_source/category_api_service.dart';
import 'package:asood/features/create_workspace/data/data_source/market_api_service.dart';
import 'package:asood/features/create_workspace/data/data_source/region_api_services.dart';
import 'package:asood/features/job_managment/data/repository/category_repository_imp.dart';
import 'package:asood/features/create_workspace/data/repository/market_repository_imp.dart';
import 'package:asood/features/create_workspace/data/repository/region_repository_imp.dart';

import 'package:asood/features/create_workspace/domain/repository/market_repository.dart';
import 'package:asood/features/create_workspace/domain/repository/region_repository.dart';
import 'package:asood/features/create_workspace/presentation/bloc/create_workspace_bloc.dart';
import 'package:asood/features/job_managment/domain/repository/category_repository.dart';
import 'package:asood/features/job_managment/presentation/bloc/jobmanagment_bloc.dart';
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
  locator.registerFactory(
    () => CategoryApiService(dioClient: locator<DioClient>()),
  );
  locator.registerFactory(
    () => MarketApiService(dioClient: locator<DioClient>()),
  );
  locator.registerFactory(
    () => RegionApiServices(dioClient: locator<DioClient>()),
  );

  /// Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(locator<AuthApiService>()),
  );
  locator.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImp(locator<CategoryApiService>()),
  );
  locator.registerLazySingleton<MarketRepository>(
    () => MarketRepositoryImp(locator<MarketApiService>()),
  );
  locator.registerLazySingleton<RegionRepository>(
    () => RegionRepositoryImp(locator<RegionApiServices>()),
  );

  /// BLOCs

  locator.registerFactory(() => SplashBloc());

  locator.registerFactory(
    () => AuthBloc(authRepository: locator<AuthRepository>()),
  );

  locator.registerFactory(
    () => CreateWorkSpaceBloc(
      locator<MarketRepository>(),
      locator<RegionRepository>(),
    ),
  );
  locator.registerFactory(
    () => JobmanagmentBloc(locator<CategoryRepository>()),
  );
}
