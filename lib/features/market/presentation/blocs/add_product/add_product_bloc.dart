import 'package:asood/core/http_client/api_status.dart';
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
    on<ProductExtraEvent>(_changeProductExtra);
    on<ProductTagSaleEvent>(_changeProductTgSale);

    on<AddTagsEvent>(_addTags);
    on<AddKeywordsEvent>(_addKeywords);
    on<RemoveKeywordsEvent>(_removeKeywords);

    on<AddNewProductEvent>(_addNewProduct);
  }

  _changeProductType(ProductTypeEvent event, Emitter<AddProductState> emit) {
    print(event.type);
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

  _changeProductExtra(ProductExtraEvent event, Emitter<AddProductState> emit) {
    emit(state.copyWith(productGift: event.gift, productExtra: event.extra));
  }

  _changeProductTgSale(
    ProductTagSaleEvent event,
    Emitter<AddProductState> emit,
  ) {
    emit(
      state.copyWith(
        productTag: event.tag,
        productPosition: event.position,
        productSaleType: event.saleType,
        productSalePrice: event.sendPrice,
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

  _addNewProduct(
    AddNewProductEvent event,
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
      requiredProduct: event.requiredProduct,
      giftProduct: event.giftProduct,
      isMarketer: event.isMarketer,
      sellType: event.sellType,
      shipCost: event.shipCost,
      shipCostPayType: event.shipCostPayType,
    );

    try {
      var res = await productRepository.createProduct(product);
      if (res is Success) {
        // var json = jsonDecode(res.response.toString());
        emit(
          state.copyWith(
            productSalePrice: '',
            productSaleType: '',
            productExtra: false,
            productType: ProductType.good,
            discountType: -1,
            isMarketer: false,
            productGift: false,
            productPrice: 0,
            productPosition: '',
            productTag: '',
            productStock: 0,
            status: CWSStatus.success,
          ),
        );
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
