import 'package:asood/features/market/data/model/product_model.dart';

abstract class ProductRepository {
  Future<dynamic> createProduct(ProductModel product) async {}
}
