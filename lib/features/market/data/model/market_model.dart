class TemplateModel {
  final String id;
  final String name;
  final int order;
  final List products;

  TemplateModel({
    required this.id,
    required this.name,
    required this.order,
    required this.products,
  });
  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      id: json['id'],
      name: json['name'],
      order: json['order'],
      products: json['products'],
    );
  }
}
