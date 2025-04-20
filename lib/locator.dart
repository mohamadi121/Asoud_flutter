import 'package:asood/features/business_card/presentation/bloc/business_bloc.dart';
import 'package:asood/features/customer/presentation/blocs/customer/customer_bloc.dart';
import 'package:asood/features/customer/presentation/blocs/profile/profile_bloc.dart';
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
import 'package:asood/features/market/data/data_source/product_api_service.dart';
import 'package:asood/features/market/data/repository/product_repository_imp.dart';
import 'package:asood/features/market/domain/repository/product_repository.dart';
import 'package:asood/features/market/presentation/blocs/add_product/add_product_bloc.dart';
import 'package:asood/features/market/presentation/blocs/bloc/market_bloc.dart';
import 'package:asood/features/market/presentation/blocs/comment/comment_bloc.dart';
import 'package:asood/features/market/presentation/blocs/theme/theme_bloc.dart';
import 'package:asood/features/product/blocs/product_bloc.dart';
import 'package:asood/features/vendor/presentation/bloc/vendor/vendor_bloc.dart';
import 'package:asood/features/vendor/presentation/bloc/workspace/workspace_bloc.dart';
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
  locator.registerFactory(
    () => ProductApiService(dioClient: locator<DioClient>()),
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
  locator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(locator<ProductApiService>()),
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
  locator.registerFactory(() => VendorBloc(locator<MarketRepository>()));
  locator.registerFactory(() => WorkspaceBloc(locator<MarketRepository>()));
  locator.registerFactory(() => AddProductBloc(locator<ProductRepository>()));
  locator.registerFactory(() => ThemeBloc());
  locator.registerFactory(() => CommentBloc());
  locator.registerFactory(() => MarketBloc());
  locator.registerFactory(() => BusinessBloc());
  locator.registerFactory(() => ProfileBloc());
  locator.registerFactory(() => CustomerBloc());
  locator.registerFactory(() => ProductBloc());
}
