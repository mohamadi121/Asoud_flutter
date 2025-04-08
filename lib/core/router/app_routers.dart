import 'package:asood/features/create_workspace/presentation/screen/create_workspace.dart';
import 'package:asood/features/job_managment/presentation/screen/job_managment.dart';
import 'package:asood/features/vendor/presentation/screen/vendor_home.dart';
import 'package:go_router/go_router.dart';

import 'package:asood/features/auth/presentation/screen/login_screen.dart';
import 'package:asood/features/auth/presentation/screen/otp_screen.dart';
import 'package:asood/features/splash/screens/splash.dart';

part './app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      GoRoute(path: Routes.otp, builder: (context, state) => const OtpScreen()),
      GoRoute(
        path: Routes.vendorHome,
        builder: (context, state) {
          // final title = state.extra as String;
          return VendorHomeScreen();
        },
      ),
      GoRoute(
        path: Routes.createWorkSpace,
        builder: (context, state) => CreateWorkSpaceScreen(),
      ),
      GoRoute(
        path: Routes.jobManagement,
        builder: (context, state) => JobManagementScreen(),
      ),
    ],
  );
}
