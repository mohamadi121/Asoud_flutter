import 'dart:convert';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/features/vendor/data/model/category_model.dart';
import 'package:asood/features/vendor/data/model/country_model.dart';
import 'package:asood/features/vendor/data/model/market_contact_model.dart';
import 'package:asood/features/vendor/data/model/market_location_model.dart';
import 'package:asood/features/vendor/data/model/work_hours_model.dart';
import 'package:asood/features/vendor/domain/repository/category_repository.dart';
import 'package:asood/features/vendor/domain/repository/market_repository.dart';
import 'package:asood/features/vendor/domain/repository/region_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_workspace_event.dart';
part 'create_workspace_state.dart';

class CreateWorkSpaceBloc
    extends Bloc<CreateWorkSpaceEvent, CreateWorkSpaceState> {
  MarketRepository marketRepo = MarketRepository();

  final RegionRepository regionRepo = RegionRepository();

  final CategoryRepository categoryRepo = CategoryRepository();

  CreateWorkSpaceBloc() : super(CreateWorkSpaceState.initial()) {
    //on ChangeTabView change active index
    on<ChangeTabView>((event, emit) {
      emit(state.copyWith(activeTabIndex: event.activeTabIndex));
    });

    //set market type
    on<SetMarketType>((event, emit) {
      emit(state.copyWith(marketType: event.marketType));
    });

    on<CreateMarket>((event, emit) async {
      try {
        emit(
          state.copyWith(
            status: CWSStatus.loading,
            marketType: "shop",
            businessId: event.businessId,
            name: event.name,
            description: event.description,
            subCategory: event.subCategory,
            slogan: event.slogan,
          ),
        );

        var res = await marketRepo.createMarketBase(
          event.marketType,
          event.businessId,
          event.name,
          event.description,
          event.subCategory,
          event.slogan,
        );

        if (res is Success) {
          var json = jsonDecode(res.response.toString());
          emit(
            state.copyWith(
              activeTabIndex: 1,
              marketType: "shop",
              status: CWSStatus.success,
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: CWSStatus.failure,
              error: res.error.toString(),
            ),
          );
        }
      } catch (e) {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    });

    on<ChangeHasWorkTime>((event, emit) {
      emit(state.copyWith(hasWorkTime: event.hasWorkTime));
      // ignore: avoid_print
      print(state.hasWorkTime);
    });
    on<Validator>((event, emit) {
      if (event.phoneNumber1.isEmpty) {
        emit(state.copyWith(phoneBorder: Colors.red));
      } else {
        emit(state.copyWith(phoneBorder: Colora.borderTag));
      }
      if (event.email.isEmpty) {
        emit(state.copyWith(emailBorder: Colors.red));
      } else {
        emit(state.copyWith(emailBorder: Colora.borderTag));
      }
    });

    on<MarketContact>(_setMarketContact);

    on<MarketLocation>(_setMarketLocation);

    on<CalPrice>(_calPrice);

    on<SetDiscount>(_setDiscount);

    on<PayPrice>(_payPrice);

    //category
    on<ChangeCategoryIndex>((event, emit) {
      emit(state.copyWith(activeCategoryIndex: event.activeCategoryIndex));
    });
    on<LoadCategory>(_getCategory);
    on<LoadMainSubCategory>(_getMainSubCategory);
    on<ChangeSubCategoryIndex>((event, emit) {
      emit(
        state.copyWith(activeSubCategoryIndex: event.activeSubCategoryIndex),
      );
    });
    on<LoadSubCategory>(_getSubCategory);

    //region
    on<LoadCountry>(_getCountries);
    on<LoadProvince>(_getProvinces);
    on<LoadCity>(_getCities);
  }

  //market contact
  _setMarketContact(
    MarketContact event,
    Emitter<CreateWorkSpaceState> emit,
  ) async {
    emit(
      state.copyWith(
        phoneNumber1: event.phoneNumber1,
        phoneNumber2: event.phoneNumber2,
        telephone: event.telephone,
        status: CWSStatus.loading,
        fax: event.fax,
        email: event.email,
        websiteUrl: event.websiteUrl,
        instagramId: event.instagramId,
        telegramId: event.telegramId,
      ),
    );
    MarketContactModel marketContact = MarketContactModel(
      market: event.marketId,
      firstMobileNumber: event.phoneNumber1,
      secondMobileNumber: event.phoneNumber2,
      telephone: event.telephone,
      fax: event.fax,
      email: event.email,
      websiteUrl: event.websiteUrl,
      instagramId: event.instagramId,
      telegramId: event.telegramId,
    );
    try {
      var res = await marketRepo.createMarketContact(marketContact);
      if (res is Success) {
        var json = jsonDecode(res.response.toString());
        emit(state.copyWith(status: CWSStatus.success));
        add(const ChangeTabView(activeTabIndex: 2));
      } else {
        emit(
          state.copyWith(
            status: CWSStatus.failure,
            error: res.error.toString(),
          ),
        );
      }
    } catch (e) {}
  }

  //market location
  _setMarketLocation(
    MarketLocation event,
    Emitter<CreateWorkSpaceState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CWSStatus.loading,
        city: event.city,
        address: event.workAddress,
        zipCode: event.postalCode,
        latitude: event.latitude,
        longitude: event.longitude,
      ),
    );
    MarketLocationModel marketLocation = MarketLocationModel(
      market: event.marketId,
      address: event.workAddress,
      city: event.city,
      zipCode: event.postalCode,
      latitude: event.latitude,
      longitude: event.longitude,
    );

    try {
      var res = await marketRepo.createMarketLocation(marketLocation);
      if (res is Success) {
        var json = jsonDecode(res.response.toString());
        emit(state.copyWith(status: CWSStatus.success));
      } else {
        emit(
          state.copyWith(
            status: CWSStatus.failure,
            error: res.error.toString(),
          ),
        );
      }
    } catch (e) {}
  }

  _calPrice(CalPrice event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: CWSStatus.success));
      } else {
        // emit(state.copyWith(
        //     status: CWSStatus.failure, error: res.error.toString()));
      }
    } catch (e) {}
  }

  _setDiscount(SetDiscount event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: CWSStatus.success));
      } else {
        // emit(state.copyWith(
        //     status: CWSStatus.failure, error: res.error.toString()));
      }
    } catch (e) {}
  }

  _payPrice(PayPrice event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: CWSStatus.success));
      } else {
        // emit(state.copyWith(
        //     status: CWSStatus.failure, error: res.error.toString()));
      }
    } catch (e) {}
  }

  //list of category
  _getCategory(LoadCategory event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = await categoryRepo.getCategoryList();
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final categoryList =
            initList.map((e) => CategoryModel.fromJson(e)).toList();
        emit(
          state.copyWith(status: CWSStatus.success, categoryList: categoryList),
        );
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
    }
  }

  //list of main sub category
  _getMainSubCategory(
    LoadMainSubCategory event,
    Emitter<CreateWorkSpaceState> emit,
  ) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = await categoryRepo.getMainSubCategoryList(event.categoryId);
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final mainSubCategory =
            initList.map((e) => MainSubCategoryModel.fromJson(e)).toList();
        emit(
          state.copyWith(
            status: CWSStatus.success,
            mainSubCategoryList: mainSubCategory,
          ),
        );
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
    }
  }

  //list of sub category
  _getSubCategory(
    LoadSubCategory event,
    Emitter<CreateWorkSpaceState> emit,
  ) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = await categoryRepo.getSubCategoryList(event.subCategoryId);
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final subCategory =
            initList.map((e) => CategoryModel.fromJson(e)).toList();
        emit(
          state.copyWith(
            status: CWSStatus.success,
            subCategoryList: subCategory,
          ),
        );
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
    }
  }

  //--------------- Region ----------
  //list of countries
  _getCountries(LoadCountry event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = await regionRepo.getCountryList();
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final countryList =
            initList.map((e) => CountryModel.fromJson(e)).toList();
        emit(
          state.copyWith(status: CWSStatus.success, countryList: countryList),
        );
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
    }
  }

  //list of provinces
  _getProvinces(LoadProvince event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = await regionRepo.getProvinceList(event.countryId);
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final provinceList =
            initList.map((e) => ProvinceModel.fromJson(e)).toList();
        emit(
          state.copyWith(status: CWSStatus.success, provinceList: provinceList),
        );
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
    }
  }

  //list of cities
  _getCities(LoadCity event, Emitter<CreateWorkSpaceState> emit) async {
    emit(state.copyWith(status: CWSStatus.loading));
    try {
      final res = await regionRepo.getCityList(event.provinceId);
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final cityList = initList.map((e) => CityModel.fromJson(e)).toList();
        emit(state.copyWith(status: CWSStatus.success, cityList: cityList));
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
    }
  }
}
