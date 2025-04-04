class CategoryModel {
  String? id;
  String? title;

  CategoryModel({this.id, this.title});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}

class MainSubCategoryModel {
  String? id;
  String? title;

  MainSubCategoryModel({this.id, this.title});

  MainSubCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
