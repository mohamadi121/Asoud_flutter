import 'package:asood/core/constants/ednpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  ApiClient apiClient = ApiClient(
    appBaseUrl: '${Endpoints.baseUrl}category/user/',
  );

  Future getCategoryList() async {
    var uri = 'group/list/';
    try {
      http.Response res = await apiClient.getData(uri);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getMainSubCategoryList(int categoryId) async {
    var uri = 'list/$categoryId';
    try {
      http.Response res = await apiClient.getData(uri);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getSubCategoryList(int mainSubCategoryId) async {
    var uri = 'sub/list/$mainSubCategoryId';
    try {
      http.Response res = await apiClient.getData(uri);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
