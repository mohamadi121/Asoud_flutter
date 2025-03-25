// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_workspace_bloc.dart';

class CreateWorkSpaceEvent extends Equatable {
  const CreateWorkSpaceEvent();

  @override
  List<Object> get props => [];
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
  final int marketId;
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
  final int marketId;
  // final String country;
  // final String state;
  final int city;
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
class ChangeTabView extends CreateWorkSpaceEvent {
  final int activeTabIndex;
  const ChangeTabView({required this.activeTabIndex});
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

//validate required text fields
class Validator extends CreateWorkSpaceEvent {
  final String phoneNumber1;

  final String email;

  const Validator({required this.phoneNumber1, required this.email});
}

class CalPrice extends CreateWorkSpaceEvent {}

class SetDiscount extends CreateWorkSpaceEvent {
  final String discountCode;
  const SetDiscount({required this.discountCode});
}

class PayPrice extends CreateWorkSpaceEvent {}

//category
class ChangeCategoryIndex extends CreateWorkSpaceEvent {
  final int activeCategoryIndex;
  const ChangeCategoryIndex({required this.activeCategoryIndex});
}

class LoadCategory extends CreateWorkSpaceEvent {}

class LoadMainSubCategory extends CreateWorkSpaceEvent {
  final String categoryId;
  const LoadMainSubCategory({required this.categoryId});
}

class ChangeSubCategoryIndex extends CreateWorkSpaceEvent {
  final String activeSubCategoryIndex;
  const ChangeSubCategoryIndex({required this.activeSubCategoryIndex});
}

class LoadSubCategory extends CreateWorkSpaceEvent {
  final String subCategoryId;
  const LoadSubCategory({required this.subCategoryId});
}

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
