import 'package:asood/features/vendor/data/data_source/category_api_service.dart';

class CategoryRepository {
  final CategoryApiService categoryApiService = CategoryApiService();

  Future<dynamic> getCategoryList() async {
    return await categoryApiService.getCategoryList();
  }

  Future<dynamic> getMainSubCategoryList(int categoryId) async {
    return await categoryApiService.getMainSubCategoryList(categoryId);
  }

  Future<dynamic> getSubCategoryList(int subCategoryId) async {
    return await categoryApiService.getSubCategoryList(subCategoryId);
  }
}
