class ProductModel {
  String? market;
  String? type;
  String? name;
  String? description;
  String? technicalDetail;
  String? subCategory;
  List<String>? keywords;
  int? stock;
  int? price;
  int? mainPrice;
  int? colleaguePrice;
  int? marketerPrice;
  int? maximumSellPrice;
  String? publishStatus;
  String? requiredProduct;
  String? giftProduct;
  bool? isMarketer;
  bool? isRequirement;
  String? tag;
  String? tagPosition;
  String? sellType;
  int? shipCost;
  String? shipCostPayType;
  String? image;

  ProductModel({
    this.market,
    this.type,
    this.name,
    this.description,
    this.technicalDetail,
    this.subCategory,
    this.keywords,
    this.stock,
    this.price,
    this.requiredProduct,
    this.giftProduct,
    this.isMarketer,
    this.sellType,
    this.shipCost,
    this.shipCostPayType,
    this.publishStatus,
    this.tagPosition,
    this.mainPrice,
    this.colleaguePrice,
    this.marketerPrice,
    this.maximumSellPrice,
    this.isRequirement,
    this.tag,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    market = json['market'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    technicalDetail = json['technical_detail'];
    subCategory = json['sub_category'];
    keywords = json['keywords'];
    stock = json['stock'];
    price = json['price'];
    giftProduct = json['gift_product'];
    requiredProduct = json['required_product'];
    isMarketer = json['is_marketer'];
    sellType = json['sell_type'];
    shipCost = json['ship_cost'];
    shipCostPayType = json['ship_cost_pay_type'];
    publishStatus = json['status'];
    tagPosition = json['tag_position'];
    mainPrice = json['main_price'];
    colleaguePrice = json['colleague_price'];
    marketerPrice = json['marketer_price'];
    maximumSellPrice = json['maximum_sell_price'];
    isRequirement = json['is_requirement'];
    tag = json['tag'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market'] = market;
    data['type'] = type;
    data['name'] = name;
    data['description'] = description;
    data['technical_detail'] = technicalDetail;
    data['sub_category'] = subCategory;
    data['keywords'] = keywords;
    data['stock'] = stock;
    data['price'] = price;
    data['gift_product'] = giftProduct ?? "";
    data['required_product'] = requiredProduct ?? "";
    data['is_marketer'] = isMarketer;
    data['sell_type'] = sellType;
    data['ship_cost'] = shipCost;
    data['ship_cost_pay_type'] = shipCostPayType;
    data['status'] = publishStatus;
    data['tag_position'] = tagPosition;
    data['main_price'] = mainPrice;
    if (colleaguePrice != null) {
      data['colleague_price'] = colleaguePrice;
    }
    if (marketerPrice != null) {
      data['marketer_price'] = marketerPrice;
    }
    if (maximumSellPrice != null) {
      data['maximum_sell_price'] = maximumSellPrice;
    }
    data['is_requirement'] = isRequirement;
    data['tag'] = tag;
    data['image'] = image;

    return data;
  }
}
