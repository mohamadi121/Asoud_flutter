import 'package:asood/features/cart/screen/shopping_cart.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:asood/core/models/market_model.dart';
import 'package:asood/features/auth/presentation/screen/login_screen.dart';
import 'package:asood/features/auth/presentation/screen/otp_screen.dart';

import 'package:asood/features/chat/screens/chat_list.dart';
import 'package:asood/features/customer/presentation/screens/customer_dashboard_screen.dart';
import 'package:asood/features/inquiry/presentation/screens/fee_inquiry.dart';
import 'package:asood/features/inquiry/presentation/screens/inquiry_details.dart';
import 'package:asood/features/inquiry/presentation/screens/inquiry_requests.dart';
import 'package:asood/features/inquiry/presentation/screens/inquiry_response.dart';
import 'package:asood/features/inquiry/presentation/screens/orders.dart';
import 'package:asood/features/inquiry/presentation/screens/submit_fee_inquiry.dart';
import 'package:asood/features/job_management/screen/job_management_screen.dart';
import 'package:asood/features/market/presentation/screens/edit_store.dart';
import 'package:asood/features/market/presentation/screens/edit_store_screen.dart';
import 'package:asood/features/market/presentation/screens/store.dart';
import 'package:asood/features/market/presentation/screens/store_info.dart';
import 'package:asood/features/panel/screens/config.dart';
import 'package:asood/features/panel/screens/inbox.dart';
import 'package:asood/features/profile/screens/profile.dart';
import 'package:asood/features/splash/screens/screens.dart';
import 'package:asood/features/splash/screens/splash.dart';
import 'package:asood/features/store_setting_screens/color_setting_screen/color_setting_screen.dart';
import 'package:asood/features/store_setting_screens/font-txtColor_setting_screen/font_color_setting_screen.dart';
import 'package:asood/features/store_setting_screens/takhfif_setting_screen/takhfif_screen.dart';
import 'package:asood/features/store_setting_screens/themes_screen/themes_screen.dart';
import 'package:asood/features/vendor/presentation/screens/create_workspace.dart';
import 'package:asood/features/vendor/presentation/screens/dashboard.dart';
import 'package:asood/features/vendor/presentation/screens/home.dart';
import 'package:asood/features/vendor/presentation/screens/settings/settings_menu_screen.dart';
import 'package:asood/features/vendor/presentation/screens/stores.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true, path: "/splash"),
    AutoRoute(page: CreateWorkSpaceRoute.page, path: "/create_workspace"),
    AutoRoute(page: CustomerDashboardRoute.page, path: "/customer_dashboard"),
    AutoRoute(page: TakhfifRoute.page, path: "/takhfif"),
    AutoRoute(page: ColorSettingRoute.page, path: "/color_setting"),
    AutoRoute(page: FontColorSettingRoute.page, path: "/font_color_setting"),
    AutoRoute(page: FeeInquiryRoute.page, path: "/fee_inquiry"),
    AutoRoute(page: InquiryDetailsRoute.page, path: "/inquiry_details"),
    AutoRoute(page: SettingsPageRoute.page, path: "/settings"),
    AutoRoute(page: OrdersListRoute.page, path: "/orders"),
    AutoRoute(page: PanelInboxRoute.page, path: "/panel_inbox"),
    AutoRoute(page: PanelConfigRoute.page, path: "/panel_config"),
    AutoRoute(page: RoutesListRoute.page, path: "/routes_list"),

    AutoRoute(page: EditStoreInfoRoute.page, path: "/edite_store"),
    AutoRoute(page: InquiryRequestsRoute.page, path: "/inquiry_requests"),
    AutoRoute(page: InquiryResponseRoute.page, path: "/inquiry_response"),
    AutoRoute(page: SubmitFeeInquiryRoute.page, path: "/submit_fee_inquiry"),
    AutoRoute(page: VendorDashboardRoute.page, path: "/vendor_dashboard"),
    AutoRoute(page: VendorProfileRoute.page, path: "/vendor_profile"),
    AutoRoute(page: VendorHomeRoute.page, path: "/vendor_home"),
    AutoRoute(page: LoginRoute.page, path: "/login"),
    AutoRoute(page: OtpRoute.page, path: "/otp"),
    AutoRoute(page: StoreRoute.page, path: "/store"),
    AutoRoute(page: StoreInfoRoute.page, path: "/store_info"),
    AutoRoute(page: EditStoreRoute.page, path: "/edit_store"),
    AutoRoute(page: StoresRoute.page, path: "/stores"),
    AutoRoute(page: JobManagementRoute.page, path: "/job_management"),
    AutoRoute(page: MultiViewSliderRoute.page, path: "/multi_view_slider"),
    AutoRoute(page: ShoppingCartRoute.page, path: "/shopping_cart"),
    AutoRoute(page: ChatListRoute.page, path: "/chat_list"),
  ];
}
