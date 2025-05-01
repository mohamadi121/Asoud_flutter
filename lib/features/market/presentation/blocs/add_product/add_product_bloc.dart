import 'package:asood/core/helper/enum_changer.dart';
import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/features/market/data/model/productL_model.dart';
import 'package:asood/features/market/data/model/product_model.dart';
import 'package:asood/features/market/domain/repository/product_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final ProductRepository productRepository;
  AddProductBloc(this.productRepository) : super(AddProductState.initial()) {
    on<AddProductEvent>((event, emit) {});

    on<ProductTypeEvent>(_changeProductType);

    on<SetIsMarketerEvent>(_changeMarketerType);
    on<SetIsRequirementEvent>(_changeIsRequirementType);

    on<SetCategoryEvent>(_changeCategory);

    on<ProductPriceStockEvent>(_changeProductPriceStockExtra);
    on<ChangeProductStockEvent>(_changeProductStock);

    on<DiscountTypeEvent>(_changeDiscountType);
    on<DiscountValuesEvent>(_changeDiscountValues);

    on<ProductExtraEvent>(_changeProductExtra);
    on<LoadProductListEvent>(_loadProductList);
    on<ChangeProductGiftAndRequiredEvent>(_changeProductRequiredGifted);

    on<ProductTagSaleEvent>(_changeProductTgSale);

    on<AddTagsEvent>(_addTags);
    on<AddKeywordsEvent>(_addKeywords);
    on<RemoveKeywordsEvent>(_removeKeywords);

    on<SubmitNewProductEvent>(_submitNewProduct);
    on<UpdatePublishStatusEvent>(_updatePublishStatus);

    on<UpdateProductDetailEvent>(_updateProductDetail);
  }

  _changeProductType(ProductTypeEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(productType: event.type));
  }

  _changeMarketerType(SetIsMarketerEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(isMarketer: event.isMarketer));
  }

  _changeIsRequirementType(
    SetIsRequirementEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(isRequirement: event.isRequirement));
  }

  _changeCategory(SetCategoryEvent event, Emitter<AddProductState> emit) {
    emit(
      state.copyWith(
        selectedCategoryName: event.selectedCategoryName,
        selectedCategoryId: event.selectedCategoryId,
      ),
    );
  }

  _changeProductStock(
    ChangeProductStockEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(productStock: event.stock));
  }

  _changeProductPriceStockExtra(
    ProductPriceStockEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(
      state.copyWith(
        productStockEnable: event.stockEnable,
        productPriceEnable: event.priceEnable,
      ),
    );
  }

  _changeDiscountType(DiscountTypeEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(discountType: event.type));
  }

  _changeDiscountValues(
    DiscountValuesEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(
      state.copyWith(
        discountPercentage: event.percentage,
        discountPeople: event.peopleNumber,
        discountDays: event.daysNumber,
        discountPosition: event.position,
      ),
    );
  }

  _changeProductExtra(ProductExtraEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(productGift: event.gift, productExtra: event.extra));
  }

  _changeProductRequiredGifted(
    ChangeProductGiftAndRequiredEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(
      state.copyWith(
        selectedProductGift: event.selectedProductGift,
        selectedProductExtra: event.selectedProductExtra,
      ),
    );
  }

  _changeProductTgSale(
    ProductTagSaleEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(
      state.copyWith(
        productTag: event.tag,
        productPosition: event.position,
        productSellType: event.sellType,
        productSendPrice: event.sendPrice,
      ),
    );
  }

  _addTags(AddTagsEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(tags: [...state.tags, event.tag]));
  }

  _addKeywords(AddKeywordsEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(keywords: [...state.keywords, event.keyword]));
  }

  _removeKeywords(RemoveKeywordsEvent event, Emitter<AddProductState> emit) {
    emit(
      state.copyWith(
        keywords:
            state.keywords
                .where((element) => element != event.keyword)
                .toList(),
      ),
    );
  }

  _loadProductList(
    LoadProductListEvent event,
    Emitter<AddProductState> emit,
  ) async {
    emit(state.copyWith(giftStatus: CWSStatus.loading));
    var res = await productRepository.productList(event.marketId);
    if (res is Success) {
      List<ProductLModel> product =
          (res.response as List).map((e) => ProductLModel.fromJson(e)).toList();

      emit(state.copyWith(giftStatus: CWSStatus.success, productList: product));
    } else if (res is Failure) {
      emit(state.copyWith(giftStatus: CWSStatus.failure));
    }
  }

  _updatePublishStatus(
    UpdatePublishStatusEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(state.copyWith(publishStatus: event.publishStatus));
  }

  _updateProductDetail(
    UpdateProductDetailEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(
      state.copyWith(
        productName: event.productName ?? state.productName,
        productDescription:
            event.productDescription ?? state.productDescription,
        productTechnicalDescription:
            event.productTechnicalDescription ??
            state.productTechnicalDescription,
      ),
    );
  }

  _submitNewProduct(
    SubmitNewProductEvent event,
    Emitter<AddProductState> emit,
  ) async {
    emit(state.copyWith(status: CWSStatus.loading));

    ProductModel product = ProductModel(
      market: event.market,
      name: event.name,
      description: event.description,
      technicalDetail: event.technicalDetail,
      stock: event.stock,
      price: event.price,
      requiredProduct: event.requiredProduct.toString(),
      giftProduct: event.giftProduct.toString(),
      isMarketer: event.isMarketer,
      sellType: sellTypeEnumChanger(event.sellType),

      /// TODO: SHOULD CHANGE THIS SHIP COST SOON FROM BACKEND
      shipCost: 2000,
      shipCostPayType:
          event.shipCostPayType != null ? SendPriceEnum.market.name : "market",
      publishStatus: publishStatusEnumChanger(event.publishStatus),
      subCategory: event.subCategory,
      keywords: event.keywords,
      tag: tagEnumChanger(event.tag),
      tagPosition: tagPositionEnumChanger(event.tagPosition),
      mainPrice: event.mainPrice,
      colleaguePrice: event.colleaguePrice,
      marketerPrice: event.marketerPrice,
      maximumSellPrice: event.maximumSellPrice,
      isRequirement: event.isRequirement,
    );

    try {
      var res = await productRepository.createProductDiscount(
        event.market,
        state.discountPosition,
        state.discountPercentage,
        state.discountDays,
      );
      if (res is Success) {
        res = await productRepository.createProduct(product);
        if (res is Success) {
          // var json = jsonDecode(res.response.toString());
          emit(
            AddProductState.initial(),
            // state.copyWith(
            //   productSendPrice: SendPriceEnum.market,
            //   productSellType: SellTypeEnum.online,
            //   productExtra: false,
            //   productType: ProductType.good,
            //   discountType: DiscountType.none,
            //   isMarketer: false,
            //   productGift: false,
            //   productPrice: 0,
            //   productPosition: PositionEnum.topLeft,
            //   productTag: TagEnum.newProduct,
            //   productStock: 0,
            //   selectedProductExtra: null,
            //   selectedProductGift: null,
            //   tags: [],
            //   keywords: [],
            //   isRequirement: false,
            //   publishStatus: PublishStatusEnum.published,
            //   discountPosition: PositionEnum.topLeft,
            //   discountPercentage: 0,
            //   discountDays: 0,
            //   status: CWSStatus.success,
            // ),
          );
        }
      } else {
        emit(state.copyWith(status: CWSStatus.failure));
        if (kDebugMode) {
          print('add product error is ${res.error.toString()}');
        }
      }
    } catch (e) {
      emit(state.copyWith(status: CWSStatus.failure));
      if (kDebugMode) {
        print('add product error is $e');
      }
    }
    emit(state.copyWith(status: CWSStatus.initial));
  }
}
