import 'dart:convert';
import 'dart:ui';

import 'package:asood/core/http_client/api_status.dart';
import 'package:asood/core/models/comment_model.dart';
import 'package:asood/core/models/theme_model.dart';
import 'package:asood/features/vendor/data/model/slider_model.dart';
import 'package:asood/features/vendor/domain/repository/market_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'vendor_event.dart';
part 'vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  final MarketRepository marketRepository = MarketRepository();

  VendorBloc() : super(VendorState.initial()) {
    on<AddLogoEvent>(_setShopLogo);
    on<DeleteLogoEvent>(_deleteShopLogo);

    on<AddBackgroundEvent>(_setShopBackground);
    on<DeleteBackgroundEvent>(_deleteShopBackground);

    on<LoadSlider>(_getSlider);
    on<AddSliderEvent>(_setShopSlider);
    on<EditSliderEvent>(_editShopSlider);
    on<DeleteSliderEvent>(_deleteShopSlider);

    on<SelectTopColor>(_selectTopColor);
    on<SelectSecondColor>(_selectSecondColor);
    on<SelectBackColor>(_selectBackColor);

    on<SelectFontColor>(_selectFontColor);
    on<SelectSecondFontColor>(_selectSecondFontColor);
    on<SelectFontFamily>(_selectFontFamily);

    on<SelectTheme>(_setMarketTheme);

    on<LoadComments>(_getComments);
  }

  //------------- logo -----------------
  _setShopLogo(AddLogoEvent event, Emitter<VendorState> emit) async {
    emit(
      state.copyWith(
        id: event.id,
        logoFile: event.logoImage,
        status: VendorStatus.loading,
      ),
    );
    var res = await marketRepository.uploadMarketLogo(
      event.logoImage,
      event.id,
    );
    if (res is Success) {
      var json = jsonDecode(res.response.toString());
      emit(state.copyWith(status: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          status: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(status: VendorStatus.initial));
  }

  _deleteShopLogo(DeleteLogoEvent event, Emitter<VendorState> emit) async {
    emit(state.copyWith(id: event.id, status: VendorStatus.loading));
    var res = await marketRepository.deleteMarketLogo(event.id);
    if (res is Success) {
      var json = jsonDecode(res.response.toString());
      emit(state.copyWith(status: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          status: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(status: VendorStatus.initial));
  }

  //------------- background -----------------
  _setShopBackground(
    AddBackgroundEvent event,
    Emitter<VendorState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.id,
        logoFile: event.backgroundImage,
        status: VendorStatus.loading,
      ),
    );
    var res = await marketRepository.uploadMarketBackground(
      event.backgroundImage,
      event.id,
    );
    if (res is Success) {
      var json = jsonDecode(res.response.toString());
      emit(state.copyWith(status: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          status: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(status: VendorStatus.initial));
  }

  _deleteShopBackground(
    DeleteBackgroundEvent event,
    Emitter<VendorState> emit,
  ) async {
    emit(state.copyWith(id: event.id, status: VendorStatus.loading));
    var res = await marketRepository.deleteMarketBackground(event.id);
    if (res is Success) {
      // var json = jsonDecode(res.response.toString());
      emit(state.copyWith(status: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          status: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(status: VendorStatus.initial));
  }

  //------------- slider -----------------
  _getSlider(LoadSlider event, Emitter<VendorState> emit) async {
    emit(state.copyWith(status: VendorStatus.loading));
    try {
      final res = await marketRepository.getMarketSliders(event.marketId);
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final sliderList =
            initList.map((e) => SliderModel.fromJson(e)).toList();
        emit(
          state.copyWith(status: VendorStatus.success, sliderList: sliderList),
        );
      } else {
        emit(state.copyWith(status: VendorStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: VendorStatus.failure));
    }
    emit(state.copyWith(status: VendorStatus.initial));
  }

  _setShopSlider(AddSliderEvent event, Emitter<VendorState> emit) async {
    emit(
      state.copyWith(
        id: event.id,
        logoFile: event.sliderImage,
        sliderStatus: VendorStatus.loading,
      ),
    );
    var res = await marketRepository.uploadMarketSlider(
      event.id,
      event.sliderImage,
    );
    if (res is Success) {
      // var json = jsonDecode(res.response.toString());
      emit(state.copyWith(sliderStatus: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          sliderStatus: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(sliderStatus: VendorStatus.initial));
  }

  _editShopSlider(EditSliderEvent event, Emitter<VendorState> emit) async {
    emit(
      state.copyWith(
        id: event.id,
        logoFile: event.sliderImage,
        sliderStatus: VendorStatus.loading,
      ),
    );
    var res = await marketRepository.editMarketSlider(
      event.id,
      event.sliderImage,
    );
    if (res is Success) {
      // var json = jsonDecode(res.response.toString());
      emit(state.copyWith(sliderStatus: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          sliderStatus: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(sliderStatus: VendorStatus.initial));
  }

  _deleteShopSlider(DeleteSliderEvent event, Emitter<VendorState> emit) async {
    emit(state.copyWith(id: event.id, status: VendorStatus.loading));
    var res = await marketRepository.deleteMarketSlider(event.id);
    if (res is Success) {
      // var json = jsonDecode(res.response.toString());
      emit(state.copyWith(status: VendorStatus.success));
    } else {
      emit(
        state.copyWith(
          status: VendorStatus.failure,
          error: res.error.toString(),
        ),
      );
    }
    emit(state.copyWith(status: VendorStatus.initial));
  }

  //-------------- color -----------------
  _selectTopColor(SelectTopColor event, Emitter<VendorState> emit) {
    emit(state.copyWith(topColor: event.topColor));
  }

  _selectSecondColor(SelectSecondColor event, Emitter<VendorState> emit) {
    emit(state.copyWith(secondColor: event.secondColor));
  }

  _selectBackColor(SelectBackColor event, Emitter<VendorState> emit) {
    emit(state.copyWith(backColor: event.backColor));
  }

  //--------------- font -----------------
  _selectFontColor(SelectFontColor event, Emitter<VendorState> emit) {
    emit(state.copyWith(fontColor: event.fontColor));
  }

  _selectSecondFontColor(
    SelectSecondFontColor event,
    Emitter<VendorState> emit,
  ) {
    emit(state.copyWith(secondFontColor: event.secondFontColor));
  }

  _selectFontFamily(SelectFontFamily event, Emitter<VendorState> emit) {
    emit(state.copyWith(fontFamily: event.fontFamily));
  }

  //--------------- theme -----------------
  _setMarketTheme(SelectTheme event, Emitter<VendorState> emit) async {
    // emit(
    //   state.copyWith(
    //     status: VendorStatus.loading,
    //     topColor: event.color,
    //     address: event.workAddress,
    //     zipCode: event.postalCode,
    //     latitude: event.latitude,
    //     longitude: event.longitude,
    //   )
    // );
    ThemeModel themeModel = ThemeModel(
      color: event.color,
      backgroundColor: event.backgroundColor,
      secondaryColor: event.secondaryColor,

      fontColor: event.fontColor,
      font: event.font,
      secondaryFontColor: event.fontSecondaryColor,
    );

    try {
      var res = await marketRepository.setMarketTheme(
        event.marketId,
        themeModel,
      );
      if (res is Success) {
        // var json = jsonDecode(res.response.toString());
        emit(state.copyWith(status: VendorStatus.success));
      } else {
        emit(
          state.copyWith(
            status: VendorStatus.failure,
            error: res.error.toString(),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: VendorStatus.failure, error: e.toString()));
    }

    emit(state.copyWith(status: VendorStatus.initial));
  }

  //------------- slider -----------------
  _getComments(LoadComments event, Emitter<VendorState> emit) async {
    emit(state.copyWith(commentStatus: VendorStatus.loading));
    try {
      final res = await marketRepository.getMarketComments(event.marketId);
      if (res is Success) {
        final json = jsonDecode(res.response.toString());
        final initList = json['data'] as List;
        final commentList =
            initList.map((e) => CommentModel.fromJson(e)).toList();
        emit(
          state.copyWith(
            commentStatus: VendorStatus.success,
            commentList: commentList,
          ),
        );
      } else {
        emit(state.copyWith(commentStatus: VendorStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(commentStatus: VendorStatus.failure));
    }
    emit(state.copyWith(commentStatus: VendorStatus.initial));
  }
}
