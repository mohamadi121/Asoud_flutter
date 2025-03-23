class ProductModel {
  int? market;
  String? name;
  String? description;
  String? technicalDetail;
  int? stock;
  int? price;
  int? requiredProduct;
  int? giftProduct;
  bool? isMarketer;
  String? sellType;
  int? shipCost;
  String? shipCostPayType;
  // int? subCategory;
  // String? keywords;
  // String? inventory;
  // int? originalPrice;
  // int? partnerPrice;
  // int? unlimitedPrice;
  // int? maximumPrice;
  // String? label;

  ProductModel({
    this.market,
    this.name,
    this.description,
    this.technicalDetail,
    this.stock,
    this.price,
    this.requiredProduct,
    this.giftProduct,
    this.isMarketer,
    this.sellType,
    this.shipCost,
    this.shipCostPayType,
    // this.label,
    // this.originalPrice,
    // this.partnerPrice,
    // this.unlimitedPrice,
    // this.maximumPrice,
    // this.complementaryProduct,
    // this.subCategory,
    // this.keywords,
    // this.inventory,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    market = json['market'];
    name = json['name'];
    description = json['description'];
    technicalDetail = json['technical_detail'];
    stock = json['stock'];
    price = json['price'];
    giftProduct = json['gift_product'];
    requiredProduct = json['required_product'];
    isMarketer = json['is_marketer'];
    sellType = json['sell_type'];
    shipCost = json['ship_cost'];
    shipCostPayType = json['ship_cost_pay_type'];
    // label = json['label'];
    // subCategory = json['sub_category'];
    // keywords = json['keywords'];
    // inventory = json['inventory'];
    // originalPrice = json['original_price'];
    // partnerPrice = json['partner_price'];
    // unlimitedPrice = json['unlimited_price'];
    // maximumPrice = json['maximum_price'];
    // complementaryProduct = json['complementary_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['market'] = market;
    data['name'] = name;
    data['description'] = description;
    data['technical_detail'] = technicalDetail;
    data['stock'] = stock;
    data['price'] = price;
    data['gift_product'] = giftProduct;
    data['required_product'] = requiredProduct;
    data['is_marketer'] = isMarketer;
    data['sell_type'] = sellType;
    data['ship_cost'] = shipCost;
    data['ship_cost_pay_type'] = shipCostPayType;
    // data['label'] = label;
    // data['sub_category'] = subCategory;
    // data['keywords'] = keywords;
    // data['inventory'] = inventory;
    // data['original_price'] = originalPrice;
    // data['partner_price'] = partnerPrice;
    // data['unlimited_price'] = unlimitedPrice;
    // data['maximum_price'] = maximumPrice;
    // data['complementary_product'] = complementaryProduct;
    return data;
  }
}
