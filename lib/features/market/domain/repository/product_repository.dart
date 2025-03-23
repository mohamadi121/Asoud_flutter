import 'package:asood/features/market/data/data_source/product_api_service.dart';
import 'package:asood/features/market/data/model/product_model.dart';

class ProductRepository {
  Future<dynamic> createProduct(ProductModel product) async {
    return await ProductApiService().createProduct(product);
  }
}
