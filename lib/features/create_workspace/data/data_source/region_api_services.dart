import 'package:http/http.dart' as http;

import 'package:asood/core/constants/endpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';

class RegionApiServices {
  ApiClient dioClient;
  RegionApiServices({required this.dioClient});

  Future getCountryList() async {
    try {
      http.Response res = await dioClient.getData(Endpoints.countryList);

      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getProvinceList(countryId) async {
    try {
      http.Response res = await dioClient.getData(
        "${Endpoints.provinceList}$countryId/",
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getCityList(provinceId) async {
    try {
      http.Response res = await dioClient.getData(
        "${Endpoints.cityList}$provinceId/",
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
