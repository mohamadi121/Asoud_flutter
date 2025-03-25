import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:asood/core/constants/ednpoints.dart';
import 'package:asood/core/http_client/api_client.dart';
import 'package:asood/core/http_client/api_status.dart';

class InquiryAPIService {
  ApiClient apiClient = ApiClient(appBaseUrl: '${Endpoints.baseUrl}inquiry/');

  Future submitInquiry(
    String inquiryType,
    String inquiryTitle,
    String? inquiryDescription,
    String? inquiryDetails,
    String inquiryCategory,
    double? inquiryAmount,
    String? inquiryUnit,
    String? inquiryName,
    List<File>? inquiryImages,
  ) async {
    var body = {};
    var uri = '';
    try {
      http.Response res = await apiClient.postData(uri, body);
      return ApiStatus(res);
    } catch (e) {
      return CustomApiStatus();
    }
  }
}
