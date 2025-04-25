import 'package:asood/core/models/market_model.dart';
import 'package:asood/features/bank_card/screens/bank_card_list.dart';
import 'package:asood/features/business_card/presentation/screens/create_business_card.dart';
import 'package:asood/features/cart/presentation/screen/shopping_cart.dart';
import 'package:asood/features/chat/screens/chat_list.dart';
import 'package:asood/features/create_workspace/presentation/screen/create_workspace.dart';
import 'package:asood/features/customer/presentation/screens/customer_dashboard_screen.dart';
import 'package:asood/features/job_managment/presentation/bloc/jobmanagment_bloc.dart';
import 'package:asood/features/job_managment/presentation/screen/job_managment.dart';
import 'package:asood/features/market/presentation/screens/create_product.dart';
import 'package:asood/features/market/presentation/screens/edit_market_screen.dart';
import 'package:asood/features/market/presentation/screens/store_detail_screen.dart';
import 'package:asood/features/market/presentation/screens/store_info.dart';
import 'package:asood/features/market/presentation/widgets/themes_screen.dart';
import 'package:asood/features/panel/screens/panel_config_screen.dart';
import 'package:asood/features/panel/screens/panel_inbox_screen.dart';
import 'package:asood/features/product/screens/product_screen.dart';
import 'package:asood/features/store_setting_screens/color_setting_screen/color_setting_screen.dart';
import 'package:asood/features/store_setting_screens/font-txtColor_setting_screen/font_color_setting_screen.dart';
import 'package:asood/features/store_setting_screens/takhfif_setting_screen/takhfif_screen.dart';
import 'package:asood/features/market/presentation/screens/market_screen.dart';

import 'package:asood/features/vendor/presentation/screen/vendor_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        builder: (context, state) {
          context.read<JobmanagmentBloc>().add(ResetJobManagmentBloc());
          context.read<JobmanagmentBloc>().add(LoadCategory());
          return JobManagementScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.storeDetail,
        builder: (context, state) {
          final market = state.extra as MarketModel;
          return StoreDetailScreen(market: market);
        },
      ),
      GoRoute(
        path: AppRoutes.editMarket,
        builder: (context, state) {
          final market = state.extra as MarketModel;
          return EditMarketScreen(market: market);
        },
      ),
      GoRoute(
        path: AppRoutes.chatList,
        builder: (context, state) => ChatList(),
      ),
      GoRoute(
        path: AppRoutes.storeInfo,
        builder: (context, state) => StoreInfoScreen(),
      ),
      GoRoute(
        path: AppRoutes.shoppingCart,
        builder: (context, state) => const ShoppingCartPage(),
      ),
      GoRoute(
        path: AppRoutes.createProduct,
        builder: (context, state) {
          final marketId = state.extra as String;
          return CreateProduct(marketId: marketId);
        },
      ),

      GoRoute(
        path: AppRoutes.markets,
        builder: (context, state) => MarketsScreen(),
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
      GoRoute(
        path: AppRoutes.multiViewSlider,
        builder: (context, state) => MultiViewSliderScreen(),
      ),
      GoRoute(
        path: AppRoutes.takhfif,
        builder: (context, state) => TakhfifScreen(),
      ),
      GoRoute(
        path: AppRoutes.fontColorSettings,
        builder: (context, state) => FontColorSettingScreen(),
      ),
      GoRoute(
        path: AppRoutes.colorSettings,
        builder: (context, state) => ColorSettingScreen(),
      ),
    ],
  );
}
