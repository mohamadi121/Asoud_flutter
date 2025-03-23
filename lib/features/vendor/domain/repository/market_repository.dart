import 'dart:convert';

import 'package:asood/core/dio/api_status.dart';
import 'package:asood/core/models/theme_model.dart';
import 'package:asood/core/utils/secure_storage.dart';
import 'package:asood/features/vendor/data/data_source/market_api_service.dart';
import 'package:asood/features/vendor/data/model/market_base.dart';
import 'package:asood/features/vendor/data/model/market_contact_model.dart';
import 'package:asood/features/vendor/data/model/market_location_model.dart';
import 'package:image_picker/image_picker.dart';

class MarketRepository {
  // late final IsarObjectService isar;

  final MarketApiService marketApiService = MarketApiService();
  MarketRepository() {
    // isar = IsarObjectService<MarketBaseModel>(MarketBaseModelSchema);
    // print(isar);
  }

  Future<dynamic> createMarketBase(
    String type,
    String businessId,
    String name,
    String description,
    int subCategory,
    String slogan,
  ) async {
    var res = await marketApiService.createMarketBase(
      type,
      businessId,
      name,
      description,
      subCategory,
      slogan,
    );
    //save the market base model to isar if its success
    if (res is Success) {
      final json = jsonDecode(res.response.toString());
      final marketBase = MarketBaseModel.fromJson(json);
      // await isar.create(marketBase);
      SecureStorage().writeSecureStorage(
        'market_id',
        json['data']['market'].toString(),
      );
      SecureStorage().writeSecureStorage('marketActiveTabIndex', '1');
    }
    return res;
  }

  //write all codes depends on market api service for repository here
  Future<dynamic> createMarketContact(MarketContactModel marketContact) async {
    SecureStorage().deleteSecureStorage('marketActiveTabIndex');
    SecureStorage().writeSecureStorage('marketActiveTabIndex', '2');
    return await marketApiService.createMarketContact(marketContact);
  }

  Future<dynamic> createMarketLocation(
    MarketLocationModel marketLocation,
  ) async {
    return await marketApiService.createMarketLocation(marketLocation);
  }

  Future<dynamic> getMarketList() async {
    return await marketApiService.getMarketList();
  }

  Future<dynamic> inactiveMarket(marketId) async {
    return await marketApiService.inactiveMarket(marketId);
  }

  Future<dynamic> queueMarket(marketId) async {
    return await marketApiService.queueMarket(marketId);
  }

  //get market sliders repository
  Future<dynamic> getMarketSliders(marketId) async {
    return await marketApiService.getMarketSlider(marketId);
  }

  //-----------------market logo--------------------

  //upload market logo repository
  Future<dynamic> uploadMarketLogo(XFile imagesFile, int marketId) async {
    return await marketApiService.uploadMarketLogo(imagesFile, marketId);
  }

  //deleteMarketLogo
  Future<dynamic> deleteMarketLogo(marketId) async {
    return await marketApiService.deleteMarketLogo(marketId);
  }

  //-----------------market background--------------------

  Future<dynamic> uploadMarketBackground(XFile imagesFile, marketId) async {
    return await marketApiService.uploadMarketBackground(imagesFile, marketId);
  }

  //delete market background
  Future<dynamic> deleteMarketBackground(marketId) async {
    return await marketApiService.deleteMarketBackground(marketId);
  }

  //-----------------market slider--------------------

  //getMarketSlider
  Future<dynamic> getMarketSliderList() async {
    return await marketApiService.getMarketList();
  }

  //createMarketSlider
  Future<dynamic> uploadMarketSlider(marketId, XFile imagesFile) async {
    return await marketApiService.createMarketSlider(marketId, imagesFile);
  }

  //createMarketSlider
  Future<dynamic> editMarketSlider(sliderId, XFile imagesFile) async {
    return await marketApiService.editMarketSlider(sliderId, imagesFile);
  }

  //modifyMarketSlider
  Future<dynamic> modifyMarketSlider(body, sliderId) async {
    return await marketApiService.modifyMarketSlider(body, sliderId);
  }

  //deleteMarketSlider
  Future<dynamic> deleteMarketSlider(sliderId) async {
    return await marketApiService.deleteMarketSlider(sliderId);
  }

  Future<dynamic> setMarketTheme(int marketId, ThemeModel themeModel) async {
    return await marketApiService.setMarketTheme(marketId, themeModel);
  }

  //get market comments repository
  Future<dynamic> getMarketComments(marketId) async {
    return await marketApiService.getMarketComments(marketId);
  }
}
