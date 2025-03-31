import 'package:dio/dio.dart';
import 'dart:convert';

class Success {
  int? code;
  Object? response;
  String? message;

  Success({this.code, this.response, this.message});
}

class Failure {
  int? code;
  Object? errorResponse;

  Failure({this.code, this.errorResponse});
}

// Handles API responses using Dio
apiStatus(Response response) {
  try {
    var res = response.data;

    if (res['success'] == true) {
      return Success(
        code: response.statusCode,
        response: utf8.decode(jsonEncode(res).codeUnits),
        message: res['message'],
      );
    } else {
      return Failure(
        code: response.statusCode,
        errorResponse: res['error']?['detail'] ?? 'خطای نامشخص!',
      );
    }
  } catch (e) {
    return Failure(
      code: response.statusCode ?? 500,
      errorResponse: 'خطای پردازش پاسخ سرور',
    );
  }
}

// Handles API errors in case of network failure or other issues
customApiStatus() {
  return Failure(code: 301, errorResponse: 'عدم برقراری ارتباط با سرور');
}
