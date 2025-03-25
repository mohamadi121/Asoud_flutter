import 'dart:io';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/features/auth/domain/repositories/user_repository.dart';
import 'package:asood/features/auth/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:asood/features/business_card/bloc/map_bloc.dart';
import 'package:asood/features/inquiry/presentation/blocs/inquiry_bloc.dart';
import 'package:asood/features/market/presentation/blocs/add_product/add_product_bloc.dart';
import 'package:asood/features/market/presentation/blocs/bloc/market_bloc.dart';
import 'package:asood/features/splash/blocs/splash_bloc.dart';
import 'package:asood/features/vendor/data/model/market_base.dart';
import 'package:asood/features/vendor/data/model/market_contact_model.dart';
import 'package:asood/features/vendor/presentation/blocs/create_workspace/create_workspace_bloc.dart';
import 'package:asood/features/vendor/presentation/blocs/vendor/vendor_bloc.dart';
import 'package:asood/features/vendor/presentation/blocs/workspace/workspace_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MarketBaseModelAdapter());
  Hive.registerAdapter(MarketContactModelAdapter());
  HttpOverrides.global = MyHttpOverrides();
  runApp(Asood());
}

class Asood extends StatelessWidget {
  const Asood({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        // BlocProvider(create: (context) => MultiViewBloc()),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepo: UserRepository()),
        ),
        BlocProvider(create: (context) => WorkspaceBloc()),
        BlocProvider<CreateWorkSpaceBloc>(
          create: (context) => CreateWorkSpaceBloc(),
        ),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
        BlocProvider<InquiryBloc>(create: (context) => InquiryBloc()),
        BlocProvider<VendorBloc>(create: (context) => VendorBloc()),
        BlocProvider<MarketBloc>(create: (context) => MarketBloc()),
        BlocProvider<AddProductBloc>(create: (context) => AddProductBloc()),
      ],
      child: MaterialApp.router(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child as Widget,
          );
        },
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', ''), Locale('fa', '')],
        locale: const Locale('fa', ''),
        title: 'آسود',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colora.primaryColor),
          useMaterial3: true,
          fontFamily: 'irs',
        ),
      ),
    );
  }
}
