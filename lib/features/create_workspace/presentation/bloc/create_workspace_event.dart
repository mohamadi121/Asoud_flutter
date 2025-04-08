part of 'create_workspace_bloc.dart';

class CreateWorkSpaceEvent {
  const CreateWorkSpaceEvent();
}

//first View Event
class CreateMarket extends CreateWorkSpaceEvent {
  final String marketType;
  final String businessId;
  final String name;
  final String description;
  final String subCategory;
  final String slogan;

  const CreateMarket({
    required this.marketType,
    required this.businessId,
    required this.name,
    required this.description,
    required this.subCategory,
    required this.slogan,
  });
}

//second View Event
class MarketContact extends CreateWorkSpaceEvent {
  final String marketId;
  final String phoneNumber1;
  final String phoneNumber2;
  final String telephone;
  final String fax;
  final String email;
  final String websiteUrl;
  final String instagramId;
  final String telegramId;
  // final bool hasWorkTime;
  // final WorkHours workHours;

  const MarketContact({
    required this.marketId,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.telephone,
    required this.fax,
    required this.email,
    required this.websiteUrl,
    required this.instagramId,
    required this.telegramId,
    // required this.hasWorkTime,
    // required this.workHours,
  });
}

//third View Event
class MarketLocation extends CreateWorkSpaceEvent {
  final String marketId;
  // final String country;
  // final String state;
  final String city;
  final String latitude;
  final String longitude;
  final String postalCode;
  final String workAddress;

  const MarketLocation({
    required this.marketId,
    required this.workAddress,
    // required this.country,
    // required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.postalCode,
  });
}

//change tabview
class ChangeWorkspaceTabView extends CreateWorkSpaceEvent {
  final int activeTabIndex;
  const ChangeWorkspaceTabView({required this.activeTabIndex});
}

//set market type
class SetMarketType extends CreateWorkSpaceEvent {
  final String marketType;
  const SetMarketType({required this.marketType});
}

//has workHours
class ChangeHasWorkTime extends CreateWorkSpaceEvent {
  final bool hasWorkTime;
  const ChangeHasWorkTime({required this.hasWorkTime});
}

//change selected category
class ChangeSelectedCategory extends CreateWorkSpaceEvent {
  final String selectedCategoryName;
  final String activeCategoryIndex;
  const ChangeSelectedCategory({
    required this.selectedCategoryName,
    required this.activeCategoryIndex,
  });
}

class CalPrice extends CreateWorkSpaceEvent {}

class SetDiscount extends CreateWorkSpaceEvent {
  final String discountCode;
  const SetDiscount({required this.discountCode});
}

class PayPrice extends CreateWorkSpaceEvent {}

//region
class LoadCountry extends CreateWorkSpaceEvent {}

class LoadProvince extends CreateWorkSpaceEvent {
  final int countryId;
  const LoadProvince({required this.countryId});
}

class LoadCity extends CreateWorkSpaceEvent {
  final int provinceId;
  const LoadCity({required this.provinceId});
}
