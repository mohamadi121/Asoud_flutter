part of 'add_product_bloc.dart';

enum ProductType { good, service }

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

  final int discountType;

  final bool productGift;
  final bool productExtra;

  final String productTag;
  final String productPosition;

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

      discountType: -1,

      productGift: false,
      productExtra: false,

      productTag: '',
      productPosition: '',

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

    int? discountType,

    bool? productGift,
    bool? productExtra,

    String? productTag,
    String? productPosition,

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
