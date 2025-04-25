part of 'add_product_bloc.dart';

sealed class AddProductEvent {
  const AddProductEvent();
}

class ProductTypeEvent extends AddProductEvent {
  final ProductType type;

  const ProductTypeEvent({required this.type});
}

class SetIsMarketerEvent extends AddProductEvent {
  final bool isMarketer;

  const SetIsMarketerEvent({required this.isMarketer});
}

class SetIsRequirementEvent extends AddProductEvent {
  final bool isRequirement;

  const SetIsRequirementEvent({required this.isRequirement});
}

class AddTagsEvent extends AddProductEvent {
  final String tag;

  const AddTagsEvent({required this.tag});
}

class ProductPriceStockEvent extends AddProductEvent {
  final bool? price;
  final bool? stock;

  const ProductPriceStockEvent({this.price, this.stock});
}

class DiscountTypeEvent extends AddProductEvent {
  final int type;

  const DiscountTypeEvent({required this.type});
}

class ProductExtraEvent extends AddProductEvent {
  final bool? gift;
  final bool? extra;

  const ProductExtraEvent({this.gift, this.extra});
}

class ProductTagSaleEvent extends AddProductEvent {
  final String? tag;
  final String? position;
  final String? saleType;
  final String? sendPrice;

  const ProductTagSaleEvent({
    this.tag,
    this.position,
    this.saleType,
    this.sendPrice,
  });
}

class AddNewProductEvent extends AddProductEvent {
  final String? market;
  final String? name;
  final String? description;
  final String? technicalDetail;
  final int? stock;
  final int? price;
  final int? requiredProduct;
  final int? giftProduct;
  final bool? isMarketer;
  final String? sellType;
  final int? shipCost;
  final String? shipCostPayType;

  const AddNewProductEvent({
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
  });
}
