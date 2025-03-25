// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

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

ApiStatus(http.Response response) {
  var res = jsonDecode(response.body);
  if (res['success'] == true) {
    return Success(
      code: res['code'],
      response: utf8.decode(response.bodyBytes),
      message: res['message'],
    );
  } else {
    return Failure(
      code: response.statusCode,
      errorResponse: res['error']['detail'],
    );
  }
}

CustomApiStatus() {
  return Failure(
    code: 301,
    errorResponse: 'عدم برقراری ارتباط با سرور',
  );
}
