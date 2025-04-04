import 'package:asood/features/vendor/data/data_source/category_api_service.dart';
import 'package:asood/features/vendor/domain/repository/category_repository.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final CategoryApiService categoryApiService;
  CategoryRepositoryImp({required this.categoryApiService});

  @override
  Future getCategoryList() async {
    return await categoryApiService.getCategoryList();
  }

  @override
  Future getMainSubCategoryList(String categoryId) async {
    return await categoryApiService.getMainSubCategoryList(categoryId);
  }

  @override
  Future getSubCategoryList(String subCategoryId) async {
    return await categoryApiService.getSubCategoryList(subCategoryId);
  }
}
