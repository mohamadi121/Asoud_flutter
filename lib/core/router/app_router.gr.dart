// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ColorSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ColorSettingScreen(),
      );
    },
    CreateWorkSpaceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateWorkSpaceScreen(),
      );
    },
    CustomerDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerDashboardScreen(),
      );
    },
    EditStoreInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EditStoreInfoScreen(),
      );
    },
    EditStoreRoute.name: (routeData) {
      final args = routeData.argsAs<EditStoreRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditStoreScreen(key: args.key, market: args.market),
      );
    },
    FeeInquiryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeeInquiryScreen(),
      );
    },
    FontColorSettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FontColorSettingScreen(),
      );
    },
    InquiryDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InquiryDetailsScreen(),
      );
    },
    InquiryRequestsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InquiryRequestsScreen(),
      );
    },
    InquiryResponseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InquiryResponseScreen(),
      );
    },
    JobManagementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JobManagementScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    ShoppingCartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShoppingCart(),
      );
    },
    ChatListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatList(),
      );
    },
    MultiViewSliderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MultiViewSliderScreen(),
      );
    },
    OrdersListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersListScreen(),
      );
    },
    OtpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OtpScreen(),
      );
    },
    PanelConfigRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PanelConfigScreen(),
      );
    },
    PanelInboxRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PanelInboxScreen(),
      );
    },
    RoutesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreensListScreen(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPageScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StoreInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoreInfoScreen(),
      );
    },
    StoreRoute.name: (routeData) {
      final args = routeData.argsAs<StoreRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: StoreScreen(key: args.key, market: args.market),
      );
    },
    StoresRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoresScreen(),
      );
    },
    SubmitFeeInquiryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubmitFeeInquiryScreen(),
      );
    },
    TakhfifRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TakhfifScreen(),
      );
    },
    VendorDashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VendorDashboardScreen(),
      );
    },
    VendorHomeRoute.name: (routeData) {
      final args = routeData.argsAs<VendorHomeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VendorHomeScreen(key: args.key, title: args.title),
      );
    },
    VendorProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VendorProfileScreen(),
      );
    },
  };
}

/// generated route for
/// [ColorSettingScreen]
class ColorSettingRoute extends PageRouteInfo<void> {
  const ColorSettingRoute({List<PageRouteInfo>? children})
    : super(ColorSettingRoute.name, initialChildren: children);

  static const String name = 'ColorSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateWorkSpaceScreen]
class CreateWorkSpaceRoute extends PageRouteInfo<void> {
  const CreateWorkSpaceRoute({List<PageRouteInfo>? children})
    : super(CreateWorkSpaceRoute.name, initialChildren: children);

  static const String name = 'CreateWorkSpaceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerDashboardScreen]
class CustomerDashboardRoute extends PageRouteInfo<void> {
  const CustomerDashboardRoute({List<PageRouteInfo>? children})
    : super(CustomerDashboardRoute.name, initialChildren: children);

  static const String name = 'CustomerDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditStoreInfoScreen]
class EditStoreInfoRoute extends PageRouteInfo<void> {
  const EditStoreInfoRoute({List<PageRouteInfo>? children})
    : super(EditStoreInfoRoute.name, initialChildren: children);

  static const String name = 'EditStoreInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditStoreScreen]
class EditStoreRoute extends PageRouteInfo<EditStoreRouteArgs> {
  EditStoreRoute({
    Key? key,
    required MarketModel market,
    List<PageRouteInfo>? children,
  }) : super(
         EditStoreRoute.name,
         args: EditStoreRouteArgs(key: key, market: market),
         initialChildren: children,
       );

  static const String name = 'EditStoreRoute';

  static const PageInfo<EditStoreRouteArgs> page = PageInfo<EditStoreRouteArgs>(
    name,
  );
}

class EditStoreRouteArgs {
  const EditStoreRouteArgs({this.key, required this.market});

  final Key? key;

  final MarketModel market;

  @override
  String toString() {
    return 'EditStoreRouteArgs{key: $key, market: $market}';
  }
}

/// generated route for
/// [FeeInquiryScreen]
class FeeInquiryRoute extends PageRouteInfo<void> {
  const FeeInquiryRoute({List<PageRouteInfo>? children})
    : super(FeeInquiryRoute.name, initialChildren: children);

  static const String name = 'FeeInquiryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FontColorSettingScreen]
class FontColorSettingRoute extends PageRouteInfo<void> {
  const FontColorSettingRoute({List<PageRouteInfo>? children})
    : super(FontColorSettingRoute.name, initialChildren: children);

  static const String name = 'FontColorSettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InquiryDetailsScreen]
class InquiryDetailsRoute extends PageRouteInfo<void> {
  const InquiryDetailsRoute({List<PageRouteInfo>? children})
    : super(InquiryDetailsRoute.name, initialChildren: children);

  static const String name = 'InquiryDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InquiryRequestsScreen]
class InquiryRequestsRoute extends PageRouteInfo<void> {
  const InquiryRequestsRoute({List<PageRouteInfo>? children})
    : super(InquiryRequestsRoute.name, initialChildren: children);

  static const String name = 'InquiryRequestsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InquiryResponseScreen]
class InquiryResponseRoute extends PageRouteInfo<void> {
  const InquiryResponseRoute({List<PageRouteInfo>? children})
    : super(InquiryResponseRoute.name, initialChildren: children);

  static const String name = 'InquiryResponseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JobManagementScreen]
class JobManagementRoute extends PageRouteInfo<void> {
  const JobManagementRoute({List<PageRouteInfo>? children})
    : super(JobManagementRoute.name, initialChildren: children);

  static const String name = 'JobManagementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        LoginRoute.name,
        args: LoginRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ShoppingCart]
class ShoppingCartRoute extends PageRouteInfo<void> {
  const ShoppingCartRoute({List<PageRouteInfo>? children})
    : super(ShoppingCartRoute.name, initialChildren: children);

  static const String name = 'ShoppingCartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatList]
class ChatListRoute extends PageRouteInfo<void> {
  const ChatListRoute({List<PageRouteInfo>? children})
    : super(ChatListRoute.name, initialChildren: children);

  static const String name = 'ChatListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MultiViewSliderScreen]
class MultiViewSliderRoute extends PageRouteInfo<void> {
  const MultiViewSliderRoute({List<PageRouteInfo>? children})
    : super(MultiViewSliderRoute.name, initialChildren: children);

  static const String name = 'MultiViewSliderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersListScreen]
class OrdersListRoute extends PageRouteInfo<void> {
  const OrdersListRoute({List<PageRouteInfo>? children})
    : super(OrdersListRoute.name, initialChildren: children);

  static const String name = 'OrdersListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpScreen]
class OtpRoute extends PageRouteInfo<void> {
  const OtpRoute({List<PageRouteInfo>? children})
    : super(OtpRoute.name, initialChildren: children);

  static const String name = 'OtpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PanelConfigScreen]
class PanelConfigRoute extends PageRouteInfo<void> {
  const PanelConfigRoute({List<PageRouteInfo>? children})
    : super(PanelConfigRoute.name, initialChildren: children);

  static const String name = 'PanelConfigRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PanelInboxScreen]
class PanelInboxRoute extends PageRouteInfo<void> {
  const PanelInboxRoute({List<PageRouteInfo>? children})
    : super(PanelInboxRoute.name, initialChildren: children);

  static const String name = 'PanelInboxRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreensListScreen]
class RoutesListRoute extends PageRouteInfo<void> {
  const RoutesListRoute({List<PageRouteInfo>? children})
    : super(RoutesListRoute.name, initialChildren: children);

  static const String name = 'RoutesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPageScreen]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute({List<PageRouteInfo>? children})
    : super(SettingsPageRoute.name, initialChildren: children);

  static const String name = 'SettingsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreInfoScreen]
class StoreInfoRoute extends PageRouteInfo<void> {
  const StoreInfoRoute({List<PageRouteInfo>? children})
    : super(StoreInfoRoute.name, initialChildren: children);

  static const String name = 'StoreInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreScreen]
class StoreRoute extends PageRouteInfo<StoreRouteArgs> {
  StoreRoute({
    Key? key,
    required MarketModel market,
    List<PageRouteInfo>? children,
  }) : super(
         StoreRoute.name,
         args: StoreRouteArgs(key: key, market: market),
         initialChildren: children,
       );

  static const String name = 'StoreRoute';

  static const PageInfo<StoreRouteArgs> page = PageInfo<StoreRouteArgs>(name);
}

class StoreRouteArgs {
  const StoreRouteArgs({this.key, required this.market});

  final Key? key;

  final MarketModel market;

  @override
  String toString() {
    return 'StoreRouteArgs{key: $key, market: $market}';
  }
}

/// generated route for
/// [StoresScreen]
class StoresRoute extends PageRouteInfo<void> {
  const StoresRoute({List<PageRouteInfo>? children})
    : super(StoresRoute.name, initialChildren: children);

  static const String name = 'StoresRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubmitFeeInquiryScreen]
class SubmitFeeInquiryRoute extends PageRouteInfo<void> {
  const SubmitFeeInquiryRoute({List<PageRouteInfo>? children})
    : super(SubmitFeeInquiryRoute.name, initialChildren: children);

  static const String name = 'SubmitFeeInquiryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TakhfifScreen]
class TakhfifRoute extends PageRouteInfo<void> {
  const TakhfifRoute({List<PageRouteInfo>? children})
    : super(TakhfifRoute.name, initialChildren: children);

  static const String name = 'TakhfifRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VendorDashboardScreen]
class VendorDashboardRoute extends PageRouteInfo<void> {
  const VendorDashboardRoute({List<PageRouteInfo>? children})
    : super(VendorDashboardRoute.name, initialChildren: children);

  static const String name = 'VendorDashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VendorHomeScreen]
class VendorHomeRoute extends PageRouteInfo<VendorHomeRouteArgs> {
  VendorHomeRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
         VendorHomeRoute.name,
         args: VendorHomeRouteArgs(key: key, title: title),
         initialChildren: children,
       );

  static const String name = 'VendorHomeRoute';

  static const PageInfo<VendorHomeRouteArgs> page =
      PageInfo<VendorHomeRouteArgs>(name);
}

class VendorHomeRouteArgs {
  const VendorHomeRouteArgs({this.key, required this.title});

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'VendorHomeRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [VendorProfileScreen]
class VendorProfileRoute extends PageRouteInfo<void> {
  const VendorProfileRoute({List<PageRouteInfo>? children})
    : super(VendorProfileRoute.name, initialChildren: children);

  static const String name = 'VendorProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
