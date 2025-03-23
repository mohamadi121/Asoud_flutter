import 'package:asood/core/utils/secure_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  // final IsarObjectService keyValueDB =
  //     IsarObjectService<KeyValue>(KeyValueSchema);
  SplashBloc() : super(SplashState.initial()) {
    on<SplashInitialEvent>((event, emit) async {
      emit(const SplashState(status: SplashStatus.loading));
      // String? token = await keyValueDB.getValueByKey("token");
      String? token = await SecureStorage().readSecureStorage('token');
      if (token != 'ND') {
        print(token);
        emit(const SplashState(status: SplashStatus.exist));
      } else {
        emit(const SplashState(status: SplashStatus.notExist));
      }
    });
  }
}
