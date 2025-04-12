import 'package:asood/features/bank_card/screens/bank_card_list.dart';
import 'package:asood/features/business_card/presentation/screens/create_business_card.dart';
import 'package:asood/features/create_workspace/presentation/screen/create_workspace.dart';
import 'package:asood/features/customer/presentation/screens/customer_dashboard_screen.dart';
import 'package:asood/features/job_managment/presentation/screen/job_managment.dart';
import 'package:asood/features/panel/screens/panel_config_screen.dart';
import 'package:asood/features/panel/screens/panel_inbox_screen.dart';
import 'package:asood/features/product/screens/product_screen.dart';
import 'package:asood/features/vendor/presentation/screen/stores_screen.dart';
import 'package:asood/features/vendor/presentation/screen/vendor_home.dart';
import 'package:go_router/go_router.dart';

import 'package:asood/features/auth/presentation/screen/login_screen.dart';
import 'package:asood/features/auth/presentation/screen/otp_screen.dart';
import 'package:asood/features/splash/screens/splash.dart';

part './app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.otp,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: AppRoutes.vendorHome,
        builder: (context, state) {
          // final title = state.extra as String;
          return VendorHomeScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.createWorkSpace,
        builder: (context, state) => CreateWorkSpaceScreen(),
      ),
      GoRoute(
        path: AppRoutes.jobManagement,
        builder: (context, state) => JobManagementScreen(),
      ),
      GoRoute(
        path: AppRoutes.storeScreen,
        builder: (context, state) => StoreScreen(),
      ),
      GoRoute(
        path: AppRoutes.createBusinessCard,
        builder: (context, state) => CreateBusinessCard(),
      ),
      GoRoute(
        path: AppRoutes.bankCardList,
        builder: (context, state) => BankCardListScreen(),
      ),
      GoRoute(
        path: AppRoutes.customerDashboard,
        builder: (context, state) => CustomerDashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.vendorDashboard,
        builder: (context, state) => VendorHomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.product,
        builder: (context, state) => ProductScreen(),
      ),
      GoRoute(
        path: AppRoutes.panelConfig,
        builder: (context, state) => PanelConfigScreen(),
      ),
      GoRoute(
        path: AppRoutes.panelInbox,
        builder: (context, state) => PanelInboxScreen(),
      ),
    ],
  );
}
