import 'package:asood/core/http_client/api_status.dart';
import 'package:dio/dio.dart';

import 'package:asood/core/http_client/api_client.dart';

import 'package:asood/features/market/data/model/product_model.dart';

class ProductApiService {
  DioClient dioClient;
  ProductApiService({required this.dioClient});

  //get products
  Future getProducts() async {
    var uri = 'product/user/list/';
    try {
      Response res = await dioClient.getData(uri);
      return apiStatus(res);
    } catch (e) {
      return customApiStatus();
    }
  }

  //get product by id
  Future getProductById(productId) async {
    var uri = 'product/user/detail/$productId';
    try {
      Response res = await dioClient.getData(uri);
      return apiStatus(res);
    } catch (e) {
      return customApiStatus();
    }
  }

  // create product
  Future createProduct(ProductModel product) async {
    var uri = 'product/user/create/';
    try {
      Response res = await dioClient.postData(uri, product.toJson());
      return apiStatus(res);
    } catch (e) {
      return customApiStatus();
    }
  }

  //get product comments
  Future getProductComments(productId) async {
    var uri = ' comment/user/product/$productId';
    try {
      Response res = await dioClient.getData(uri);
      return apiStatus(res);
    } catch (e) {
      return customApiStatus();
    }
  }
}
