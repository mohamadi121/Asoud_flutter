import 'package:asood/features/market/data/data_source/product_api_service.dart';
import 'package:asood/features/market/data/model/product_model.dart';
import 'package:asood/features/market/domain/repository/product_repository.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductApiService productApiService;
  ProductRepositoryImp(this.productApiService);
  @override
  Future createProduct(ProductModel product) async {
    return await productApiService.createProduct(product);
  }
}
