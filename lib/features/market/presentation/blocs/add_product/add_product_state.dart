part of 'add_product_bloc.dart';

enum ProductType { good, service }

enum DiscountType { none, percent, timed, group }

enum PositionEnum { topLeft, topRight, bottomLeft, bottomRight }

class AddProductState {
  final CWSStatus status;

  final ProductType productType;

  final bool isMarketer;
  final bool isRequirement;

  final String selectedCategoryName;
  final String selectedCategoryId;

  final List<String> tags;
  final List<String> keywords;

  final int productStock;
  final bool productStockEnable;
  final int productPrice;
  final bool productPriceEnable;

  final int discountPercentage;
  final int discountPeople;
  final int discountDays;
  final DiscountType discountType;
  final PositionEnum discountPosition;

  final bool productGift;
  final bool productExtra;

  final String productTag;
  final PositionEnum productPosition;

  final String productSaleType;
  final String productSalePrice;

  final List productImages;

  const AddProductState({
    required this.status,

    required this.productType,

    required this.isMarketer,
    required this.isRequirement,

    required this.selectedCategoryName,
    required this.selectedCategoryId,

    required this.tags,
    required this.keywords,

    required this.productStock,
    required this.productStockEnable,
    required this.productPrice,
    required this.productPriceEnable,

    required this.discountType,
    required this.discountPercentage,
    required this.discountPeople,
    required this.discountDays,
    required this.discountPosition,

    required this.productGift,
    required this.productExtra,

    required this.productTag,
    required this.productPosition,

    required this.productSaleType,
    required this.productSalePrice,

    required this.productImages,
  });

  factory AddProductState.initial() {
    return const AddProductState(
      status: CWSStatus.initial,

      productType: ProductType.good,

      isMarketer: false,
      isRequirement: false,

      selectedCategoryName: '',
      selectedCategoryId: '',

      tags: [],
      keywords: [],

      productStock: 0,
      productStockEnable: false,
      productPrice: 0,
      productPriceEnable: false,

      discountType: DiscountType.none,
      discountPercentage: 50,
      discountPeople: 0,
      discountDays: 0,
      discountPosition: PositionEnum.topLeft,

      productGift: false,
      productExtra: false,

      productTag: '',
      productPosition: PositionEnum.topLeft,

      productSaleType: '',
      productSalePrice: '',

      productImages: [],
    );
  }

  AddProductState copyWith({
    CWSStatus? status,

    ProductType? productType,

    bool? isMarketer,
    bool? isRequirement,

    String? selectedCategoryName,
    String? selectedCategoryId,

    List<String>? tags,
    List<String>? keywords,

    int? productStock,
    bool? productStockEnable,
    int? productPrice,
    bool? productPriceEnable,

    DiscountType? discountType,
    int? discountPercentage,
    int? discountPeople,
    int? discountDays,
    PositionEnum? discountPosition,

    bool? productGift,
    bool? productExtra,

    String? productTag,
    PositionEnum? productPosition,

    String? productSaleType,
    String? productSalePrice,

    List? productImages,
  }) {
    return AddProductState(
      status: status ?? this.status,

      productType: productType ?? this.productType,

      isMarketer: isMarketer ?? this.isMarketer,
      isRequirement: isRequirement ?? this.isRequirement,

      selectedCategoryName: selectedCategoryName ?? this.selectedCategoryName,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,

      tags: tags ?? this.tags,
      keywords: keywords ?? this.keywords,

      productStock: productStock ?? this.productStock,
      productStockEnable: productStockEnable ?? this.productStockEnable,
      productPrice: productPrice ?? this.productPrice,
      productPriceEnable: productPriceEnable ?? this.productPriceEnable,

      discountType: discountType ?? this.discountType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountPeople: discountPeople ?? this.discountPeople,
      discountDays: discountDays ?? this.discountDays,
      discountPosition: discountPosition ?? this.discountPosition,

      productGift: productGift ?? this.productGift,
      productExtra: productExtra ?? this.productExtra,

      productTag: productTag ?? this.productTag,
      productPosition: productPosition ?? this.productPosition,

      productSaleType: productSaleType ?? this.productSaleType,
      productSalePrice: productSalePrice ?? this.productSalePrice,

      productImages: productImages ?? this.productImages,
    );
  }
}
