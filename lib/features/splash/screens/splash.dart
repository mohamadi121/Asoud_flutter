import 'package:asood/core/router/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/splash_bloc.dart';

@RoutePage()
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
          context.router.replace(VendorHomeRoute(title: ''));
          // Navigator.pushReplacementNamed(context, VendorHomeScreen.routeName);
        } else if (state.status == SplashStatus.notExist) {
          context.router.replace(LoginRoute());
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
