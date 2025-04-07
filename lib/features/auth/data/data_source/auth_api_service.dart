import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/constants/endpoints.dart';
import 'package:http/http.dart' as http;

import 'package:asood/core/helper/secure_storage.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';

class AuthApiService {
  final ApiClient dioClient;
  AuthApiService({required this.dioClient});

  // Send verification code to user
  Future userAuth(String number) async {
    var body = {"mobile_number": number};

    try {
      http.Response res = await dioClient.postData(
        Endpoints.loginCreate,
        body,
        headers: Endpoints.simpleHeader,
      );
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Verify user SMS code
  Future verifyUser(String number, String code) async {
    var body = {"mobile_number": number, 'pin': code};

    try {
      http.Response res = await dioClient.postData(
        Endpoints.loginVerify,
        body,
        headers: Endpoints.simpleHeader,
      );

      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Get user advertisements
  Future getAdvertises() async {
    try {
      http.Response res = await dioClient.getData(Endpoints.userAdvertise);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Get user contacts
  Future getContacts() async {
    try {
      http.Response res = await dioClient.getData(Endpoints.userContact);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }

  // Log out user
  Future logout() async {
    try {
      String? token = await SecureStorage.readSecureStorage(Keys.token);

      http.Response res = await dioClient.getData(
        Endpoints.logout,
        headers: {'Authorization': 'Token $token'},
      );

      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
