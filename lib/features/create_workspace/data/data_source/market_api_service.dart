import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:asood/core/constants/endpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/core/models/theme_model.dart';
import 'package:asood/features/vendor/data/model/market_contact_model.dart';
import 'package:asood/features/vendor/data/model/market_location_model.dart';

class MarketApiService {
  ApiClient dioClient;
  MarketApiService({required this.dioClient});

  // Create market base
  Future createMarketBase(
    String type,
    String businessId,
    String name,
    String description,
    String subCategory,
    String slogan,
  ) async {
    var body = {
      "type": type,
      "business_id": businessId,
      "name": name,
      "description": description,
      "sub_category": subCategory,
      "slogan": slogan,
    };

    try {
      http.Response res = await dioClient.postData(
        Endpoints.ownerCreateMarket,
        body,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Create contact information
  Future createMarketContact(MarketContactModel marketContact) async {
    var body = {
      "market": marketContact.market,
      "first_mobile_number": marketContact.firstMobileNumber,
      "second_mobile_number": marketContact.secondMobileNumber,
      "telephone": marketContact.telephone,
      "fax": marketContact.fax,
      "email": marketContact.email,
      "website_url": marketContact.websiteUrl,
      "instagram_id": marketContact.instagramId,
      "telegram_id": marketContact.telegramId,
    };

    try {
      http.Response res = await dioClient.postData('contact/create/', body);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Create market location
  Future createMarketLocation(MarketLocationModel marketLocation) async {
    var body = {
      "market": marketLocation.market,
      "city": marketLocation.city,
      "address": marketLocation.address,
      "zip_code": marketLocation.zipCode,
      "latitude": marketLocation.latitude,
      "longitude": marketLocation.longitude,
    };

    try {
      http.Response res = await dioClient.postData('location/create/', body);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Get market list
  Future getMarketList() async {
    try {
      http.Response res = await dioClient.getData('list/');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Inactive market
  Future inactiveMarket(String marketId) async {
    try {
      http.Response res = await dioClient.getData('inactive/$marketId');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Queue market
  Future queueMarket(String marketId) async {
    try {
      http.Response res = await dioClient.getData('queue/$marketId');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Upload market logo
  Future uploadMarketLogo(XFile imagesFile, marketId) async {
    List<MultipartBody> images = [MultipartBody('logo_img', imagesFile)];
    try {
      http.Response res = await dioClient.postMultipartData(
        'logo/$marketId/',
        {},
        images,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Delete market logo
  Future deleteMarketLogo(String marketId) async {
    try {
      http.Response res = await dioClient.deleteData('logo/$marketId/');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Upload market background
  Future uploadMarketBackground(XFile imagesFile, String marketId) async {
    List<MultipartBody> images = [MultipartBody('background_img', imagesFile)];
    try {
      http.Response res = await dioClient.postMultipartData(
        'background/$marketId/',
        {},
        images,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Delete market background
  Future deleteMarketBackground(String marketId) async {
    try {
      http.Response res = await dioClient.deleteData('background/$marketId/');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Get market slider by id
  Future getMarketSlider(String marketId) async {
    try {
      http.Response res = await dioClient.getData('slider/$marketId');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Create new slider by id
  Future createMarketSlider(String marketId, XFile imagesFile) async {
    List<MultipartBody> images = [MultipartBody('slider_img', imagesFile)];
    try {
      http.Response res = await dioClient.postMultipartData(
        'slider/$marketId/',
        {},
        images,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Edit slider by id
  Future editMarketSlider(String sliderId, XFile imagesFile) async {
    List<MultipartBody> images = [MultipartBody('slider_img', imagesFile)];
    try {
      http.Response res = await dioClient.patchMultipartData(
        'slider/$sliderId/',
        {},
        images,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Modify slider by slider id
  Future modifyMarketSlider(Map<String, dynamic> body, String sliderId) async {
    try {
      http.Response res = await dioClient.patchData('slider/$sliderId', body);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Delete slider by id
  Future deleteMarketSlider(String sliderId) async {
    try {
      http.Response res = await dioClient.deleteData('slider/$sliderId/');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Set market theme
  Future setMarketTheme(int marketId, ThemeModel themeModel) async {
    var body = {
      "color": themeModel.color,
      "background_color": themeModel.backgroundColor,
      "secondary_color": themeModel.secondaryColor,
      "font_color": themeModel.fontColor,
      "font": themeModel.font,
      "secondary_font_color": themeModel.secondaryFontColor,
    };
    try {
      http.Response res = await dioClient.postData('theme/$marketId/', body);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Get market comments
  Future getMarketComments(String marketId) async {
    try {
      http.Response res = await dioClient.getData('comment/list/$marketId');
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
