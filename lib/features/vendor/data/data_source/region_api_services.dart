import 'package:asood/core/constants/ednpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:http/http.dart' as http;

class RegionApiServices {
  ApiClient apiClient = ApiClient(
    appBaseUrl: '${Endpoints.baseUrl}region/user/',
  );

  Future getCountryList() async {
    var uri = 'country/list/';
    try {
      http.Response res = await apiClient.getData(uri);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getProvinceList(countryId) async {
    var uri = 'province/list/$countryId';
    try {
      http.Response res = await apiClient.getData(uri);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getCityList(provinceId) async {
    var uri = 'city/list/$provinceId';
    try {
      http.Response res = await apiClient.getData(uri);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
