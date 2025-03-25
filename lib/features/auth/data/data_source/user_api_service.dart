import 'package:http/http.dart' as http;

import 'package:asood/core/constants/ednpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';

class UserApiService {
  ApiClient apiClient = ApiClient(appBaseUrl: Endpoints.login);

  //send code verification to user by server
  Future userAuth(String number) async {
    var body = {"mobile_number": number};

    try {
      http.Response res = await apiClient.postData(
        Endpoints.loginCreate,
        body,
        headers: Endpoints.simpleHeader,
      );

      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  //verify the sms code verification
  Future verifyUser(String number, String code) async {
    var body = {"mobile_number": number, 'pin': code};

    try {
      http.Response res = await apiClient.postData(
        Endpoints.loginVerify,
        body,
        headers: Endpoints.simpleHeader,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  //get user advertises
  Future getAdvertises() async {
    try {
      http.Response res = await apiClient.getData(Endpoints.userAdvertise);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  //get user contacts
  Future getContacts() async {
    try {
      http.Response res = await apiClient.getData(Endpoints.userContact);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  //log out user
  Future logout() async {
    var token = '';
    try {
      http.Response res = await apiClient.getData(
        Endpoints.logout,
        headers: {'Authorization': 'Token $token'},
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
