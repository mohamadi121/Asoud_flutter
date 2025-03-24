import 'package:asood/core/router/app_routers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SplashInitialEvent());
    /*Future.delayed(const Duration(seconds: 2), () {
      //  Navigator.pushNamed(context, LoginScreen.routeName);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
      );
    });*/

    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status == SplashStatus.exist) {
          context.go(Routes.vendorHome, extra: "");
          // Navigator.pushReplacementNamed(context, VendorHomeScreen.routeName);
        } else if (state.status == SplashStatus.notExist) {
          context.go(Routes.login);

          //  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset('assets/images/login.png', fit: BoxFit.cover),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
