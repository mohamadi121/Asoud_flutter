part of 'add_product_bloc.dart';

enum AddProductStatus { initial, loading, success, failure }

class AddProductState extends Equatable{

  final AddProductStatus status;

  final bool productType;

  final bool isMarketer;

  final List<String> tags;

  final bool productStock;
  final bool productPrice;

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

    required this.tags,

    required this.productStock,
    required this.productPrice,

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

      status: AddProductStatus.initial,

      productType: true,

      isMarketer: false,

      tags: [],

      productStock : false,
      productPrice : false,

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

    AddProductStatus? status,

    bool? productType,

    bool? isMarketer,

    List<String>? tags,

    bool? productStock,
    bool? productPrice,

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

      tags: tags ?? this.tags,

      productStock: productStock ?? this.productStock,
      productPrice: productPrice ?? this.productPrice,

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


  @override
  List<Object> get props {
    return [

      status,

      productType,

      isMarketer,

      tags,

      productStock,
      productPrice,

      discountType,

      productGift,
      productExtra,

      productTag,
      productPosition,

      productSaleType,
      productSalePrice,

      productImages,

    ];
  }
}
