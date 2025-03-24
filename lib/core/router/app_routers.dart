// import 'package:asood/core/models/market_model.dart';
// import 'package:asood/features/job_management/screen/job_management_screen.dart';
// import 'package:asood/features/market/presentation/screens/edit_store.dart';
// import 'package:asood/features/market/presentation/screens/edit_store_screen.dart';
// import 'package:asood/features/market/presentation/widgets/themes_screen.dart';
// import 'package:asood/features/store_setting_screens/color_setting_screen/color_setting_screen.dart';
// import 'package:asood/features/store_setting_screens/font-txtColor_setting_screen/font_color_setting_screen.dart';
// import 'package:asood/features/vendor/presentation/screens/create_workspace.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// // 📌 ایمپورت صفحات
// import 'package:asood/features/splash/screens/splash.dart';
// import 'package:asood/features/auth/presentation/screen/login_screen.dart';
// import 'package:asood/features/auth/presentation/screen/otp_screen.dart';
// import 'package:asood/features/cart/screen/shopping_cart.dart';
// import 'package:asood/features/chat/screens/chat_list.dart';
// import 'package:asood/features/customer/presentation/screens/customer_dashboard_screen.dart';
// import 'package:asood/features/inquiry/presentation/screens/fee_inquiry.dart';
// import 'package:asood/features/inquiry/presentation/screens/inquiry_details.dart';
// import 'package:asood/features/inquiry/presentation/screens/inquiry_requests.dart';
// import 'package:asood/features/inquiry/presentation/screens/inquiry_response.dart';
// import 'package:asood/features/inquiry/presentation/screens/orders.dart';
// import 'package:asood/features/inquiry/presentation/screens/submit_fee_inquiry.dart';
// import 'package:asood/features/market/presentation/screens/store.dart';
// import 'package:asood/features/market/presentation/screens/store_info.dart';

// part 'app_router.gr.dart';

// @AutoRouterConfig()
// class AppRouter extends _$AppRouter {
//   @override
//   List<AutoRoute> get routes => [
//     AutoRoute(page: SplashRoute.page, initial: true, path: "/splash"),
//     AutoRoute(page: LoginRoute.page, path: "/login"),
//     AutoRoute(page: OtpRoute.page, path: "/otp"),
//     AutoRoute(page: CustomerDashboardRoute.page, path: "/customer_dashboard"),
//     AutoRoute(page: FeeInquiryRoute.page, path: "/fee_inquiry"),
//     AutoRoute(page: InquiryDetailsRoute.page, path: "/inquiry_details"),
//     AutoRoute(page: InquiryRequestsRoute.page, path: "/inquiry_requests"),
//     AutoRoute(page: InquiryResponseRoute.page, path: "/inquiry_response"),
//     AutoRoute(page: SubmitFeeInquiryRoute.page, path: "/submit_fee_inquiry"),
//     AutoRoute(page: OrdersListRoute.page, path: "/orders"),
//     AutoRoute(page: StoreRoute.page, path: "/store"),
//     AutoRoute(page: StoreInfoRoute.page, path: "/store_info"),
//     AutoRoute(page: ShoppingCartRoute.page, path: "/shopping_cart"),

//     AutoRoute(page: ChatListRoute.page, path: "/chat_list"),
//   ];
// }
import 'package:asood/core/models/market_model.dart';
import 'package:asood/features/job_management/screen/job_management_screen.dart';
import 'package:asood/features/market/presentation/screens/add_product.dart';
import 'package:asood/features/market/presentation/screens/edit_store.dart';
import 'package:asood/features/market/presentation/screens/edit_store_screen.dart';
import 'package:asood/features/market/presentation/widgets/themes_screen.dart';
import 'package:asood/features/panel/screens/config.dart';
import 'package:asood/features/panel/screens/inbox.dart';
import 'package:asood/features/profile/screens/profile.dart';
import 'package:asood/features/splash/screens/screens.dart';
import 'package:asood/features/store_setting_screens/color_setting_screen/color_setting_screen.dart';
import 'package:asood/features/store_setting_screens/font-txtColor_setting_screen/font_color_setting_screen.dart';
import 'package:asood/features/store_setting_screens/takhfif_setting_screen/takhfif_screen.dart';
import 'package:asood/features/vendor/presentation/screens/dashboard.dart';
import 'package:asood/features/vendor/presentation/screens/home.dart';
import 'package:asood/features/vendor/presentation/screens/settings/settings_menu_screen.dart';

import 'package:go_router/go_router.dart';

// 📌 ایمپورت صفحات
import 'package:asood/features/splash/screens/splash.dart';
import 'package:asood/features/auth/presentation/screen/login_screen.dart';
import 'package:asood/features/auth/presentation/screen/otp_screen.dart';
import 'package:asood/features/cart/screen/shopping_cart.dart';
import 'package:asood/features/chat/screens/chat_list.dart';
import 'package:asood/features/customer/presentation/screens/customer_dashboard_screen.dart';
import 'package:asood/features/inquiry/presentation/screens/fee_inquiry.dart';
import 'package:asood/features/inquiry/presentation/screens/inquiry_details.dart';
import 'package:asood/features/inquiry/presentation/screens/inquiry_requests.dart';
import 'package:asood/features/inquiry/presentation/screens/inquiry_response.dart';
import 'package:asood/features/inquiry/presentation/screens/orders.dart';
import 'package:asood/features/inquiry/presentation/screens/submit_fee_inquiry.dart';
import 'package:asood/features/market/presentation/screens/store.dart';
import 'package:asood/features/market/presentation/screens/store_info.dart';

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
          final title = state.extra as String;
          return VendorHomeScreen(title: title);
        },
      ),
      GoRoute(
        path: Routes.vendorDashboard,
        builder: (context, state) => VendorDashboardScreen(),
      ),
      GoRoute(
        path: Routes.vendorProfile,
        builder: (context, state) => VendorProfileScreen(),
      ),
      GoRoute(
        path: Routes.customerDashboard,
        builder: (context, state) => const CustomerDashboardScreen(),
      ),
      GoRoute(
        path: Routes.feeInquiry,
        builder: (context, state) => const FeeInquiryScreen(),
      ),
      GoRoute(
        path: Routes.inquiryDetails,
        builder: (context, state) => const InquiryDetailsScreen(),
      ),
      GoRoute(
        path: Routes.inquiryRequests,
        builder: (context, state) => const InquiryRequestsScreen(),
      ),
      GoRoute(
        path: Routes.inquiryResponse,
        builder: (context, state) => const InquiryResponseScreen(),
      ),
      GoRoute(
        path: Routes.submitFeeInquiry,
        builder: (context, state) => const SubmitFeeInquiryScreen(),
      ),
      GoRoute(
        path: Routes.ordersLists,
        builder: (context, state) => const OrdersListScreen(),
      ),
      GoRoute(
        path: Routes.store,
        builder: (context, state) {
          final market = state.extra as MarketModel;
          return StoreScreen(market: market);
        },
      ),
      GoRoute(
        path: Routes.storeInfo,
        builder: (context, state) => const StoreInfoScreen(),
      ),
      GoRoute(
        path: Routes.shoppingCart,
        builder: (context, state) => const ShoppingCartPage(),
      ),
      GoRoute(path: Routes.chatList, builder: (context, state) => ChatList()),
      GoRoute(
        path: Routes.takhfif,
        builder: (context, state) => TakhfifScreen(),
      ),
      GoRoute(
        path: Routes.editStoreInfo,
        builder: (context, state) => EditStoreInfoScreen(),
      ),
      GoRoute(
        path: Routes.editStore,
        builder: (context, state) {
          final market = state.extra as MarketModel;
          return EditStoreScreen(market: market);
        },
      ),
      GoRoute(
        path: Routes.screenLists,
        builder: (context, state) => ScreensListScreen(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => SettingsPageScreen(),
      ),
      GoRoute(
        path: Routes.colorSettings,
        builder: (context, state) => ColorSettingScreen(),
      ),
      GoRoute(
        path: Routes.fontColorSettings,
        builder: (context, state) => FontColorSettingScreen(),
      ),
      GoRoute(
        path: Routes.jobManagement,
        builder: (context, state) => JobManagementScreen(),
      ),
      GoRoute(
        path: Routes.addProduct,
        builder: (context, state) {
          final marketId = state.extra as int;
          return AddProduct(marketId: marketId);
        },
      ),
      GoRoute(
        path: Routes.multiViewSlider,
        builder: (context, state) => MultiViewSliderScreen(),
      ),
      GoRoute(
        path: Routes.panelConfig,
        builder: (context, state) => PanelConfigScreen(),
      ),
      GoRoute(
        path: Routes.panelInbox,
        builder: (context, state) => PanelInboxScreen(),
      ),
    ],
  );
}
