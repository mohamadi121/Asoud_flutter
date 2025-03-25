import 'package:asood/core/constants/ednpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  ApiClient apiClient = ApiClient(appBaseUrl: Endpoints.userCategory);

  Future getCategoryList() async {
    try {
      http.Response res = await apiClient.getData(Endpoints.categoryGroupList);

      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getMainSubCategoryList(String categoryId) async {
    try {
      http.Response res = await apiClient.getData(
        "${Endpoints.categoryList}$categoryId/",
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  Future getSubCategoryList(String mainSubCategoryId) async {
    try {
      http.Response res = await apiClient.getData(
        "${Endpoints.subCategoryList}$mainSubCategoryId/",
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
