import 'dart:convert';
import 'dart:io';

import 'package:asood/core/constants/constants.dart';
import 'package:asood/core/helper/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'error_response.dart';

class ApiClient {
  final String appBaseUrl;

  static const String noInternetMessage = 'عدم برقراری ارتباط با سرور';
  final int timeoutInSeconds = 30;

  String? token;
  Map<String, String> _mainHeaders = {};
  readToken() async {
    token = await SecureStorage.readSecureStorage(Keys.token);
    updateHeader(token);
  }

  ApiClient({required this.appBaseUrl});

  Map<String, String> updateHeader(String? token, {bool setHeader = true}) {
    Map<String, String> header = {};
    header.addAll({
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Token $token',
    });
    if (setHeader) {
      _mainHeaders = header;
    }
    return header;
  }

  //get method handler for api
  Future<http.Response> getData(
    String uri, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    headers == null ? await readToken() : null;

    try {
      if (kDebugMode) {
        debugPrint('Token: $token');
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http
          .get(Uri.parse(appBaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));

      return handleResponse(response, uri);
    } catch (e) {
      if (kDebugMode) {
        print('----------------${e.toString()}');
      }
      return http.Response(noInternetMessage, 1);
    }
  }

  //post data to api
  Future<http.Response> postData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      headers == null ? await readToken() : null;
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body');
      }
      http.Response response = await http
          .post(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      debugPrint('====> API Status Code: ${response.statusCode}');
      return handleResponse(response, uri);
    } catch (e) {
      return http.Response(noInternetMessage, 1);
    }
  }

  //image upload to server
  Future<http.Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
  }) async {
    headers == null ? await readToken() : null;
    try {
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body with ${multipartBody.length} files');
      }
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(appBaseUrl + uri),
      );
      request.headers.addAll(headers ?? _mainHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(
            http.MultipartFile(
              multipart.key,
              multipart.file!.readAsBytes().asStream(),
              list.length,
              filename: 'asood.png',
            ),
          );
        }
      }
      request.fields.addAll(body);
      http.Response response = await http.Response.fromStream(
        await request.send(),
      );
      print(response.statusCode);
      return handleResponse(response, uri);
    } catch (e) {
      return http.Response(noInternetMessage, 1);
    }
  }

  //image upload to server
  Future<http.Response> patchMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
  }) async {
    headers == null ? await readToken() : null;
    try {
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body with ${multipartBody.length} files');
      }
      http.MultipartRequest request = http.MultipartRequest(
        'PATCH',
        Uri.parse(appBaseUrl + uri),
      );
      request.headers.addAll(headers ?? _mainHeaders);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(
            http.MultipartFile(
              multipart.key,
              multipart.file!.readAsBytes().asStream(),
              list.length,
              filename: 'asood.png',
            ),
          );
        }
      }
      request.fields.addAll(body);
      http.Response response = await http.Response.fromStream(
        await request.send(),
      );
      print(response.statusCode);
      return handleResponse(response, uri);
    } catch (e) {
      return http.Response(noInternetMessage, 1);
    }
  }

  //put data to api
  Future<http.Response> putData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      headers == null ? await readToken() : null;
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body');
      }
      http.Response response = await http
          .put(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return http.Response(noInternetMessage, 1);
    }
  }

  //patch data
  Future<http.Response> patchData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      headers == null ? await readToken() : null;
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body');
      }
      http.Response response = await http
          .patch(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return http.Response(noInternetMessage, 1);
    }
  }

  //delete methode
  Future<http.Response> deleteData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      headers == null ? await readToken() : null;
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http
          .delete(Uri.parse(appBaseUrl + uri), headers: headers ?? _mainHeaders)
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return http.Response(noInternetMessage, 1);
    }
  }

  ///handle the http response and return controlled response to repository
  http.Response handleResponse(http.Response response, String uri) {
    try {} catch (_) {}
    //create a response object
    http.Response response0 = http.Response(
      response.body,
      response.statusCode,
      // response.body.toString(),
      request: CustomRequest(response.request!.method, response.request!.url),
      headers: response.headers,
      reasonPhrase: response.reasonPhrase,
    );

    if (response0.statusCode != 200 ||
        response0.statusCode != 201 && response0.body is! String) {
      var errorResponse = handleHttpError(response0.statusCode);
      response0 = http.Response(
        response0.body,
        response0.statusCode,
        reasonPhrase: errorResponse,
      );
    } else if (response0.statusCode != 200 ||
        response0.statusCode != 201 && response0.body == null) {
      response0 = http.Response("", 0, reasonPhrase: noInternetMessage);
    }
    if (kDebugMode) {
      debugPrint(
        '====> API http.Response: [${response0.statusCode}] $uri\n${response0.body}',
      );
    }
    return response0;
  }
}

class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}

class CustomRequest extends http.BaseRequest {
  CustomRequest(super.method, super.url);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
