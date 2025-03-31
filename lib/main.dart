import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/router/app_routers.dart';
import 'package:asood/features/auth/presentation/blocs/login_bloc.dart';
import 'package:asood/features/splash/blocs/splash_bloc.dart';
import 'package:asood/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await locatorSetup();

  runApp(Asood());
}

class Asood extends StatelessWidget {
  const Asood({super.key});

  @override
  Widget build(BuildContext context) {
    // device rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<SplashBloc>()),
        BlocProvider(create: (context) => locator<AuthBloc>()),
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
          fontFamily: FontFamily.irs,
        ),
      ),
    );
  }
}
