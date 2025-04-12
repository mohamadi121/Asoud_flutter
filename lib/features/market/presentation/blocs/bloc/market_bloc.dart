import 'package:bloc/bloc.dart';

part 'market_event.dart';
part 'market_state.dart';

class MarketBloc extends Bloc<MarketEvent, MarketState> {
  MarketBloc() : super(MarketState.initial()) {
    on<MarketEvent>((event, emit) {});

    on<AddTemplateEvent>(_addTemplate);
    on<RemoveTemplateEvent>(_removeTemplate);
    on<ShowTemplatesEvent>(_showTemplates);
  }

  _addTemplate(AddTemplateEvent event, Emitter<MarketState> emit) {
    emit(state.copyWith(templateList: [...state.templateList, event.template]));
  }

  _removeTemplate(RemoveTemplateEvent event, Emitter<MarketState> emit) {
    state.templateList.removeAt(event.index);
    // print(state.templateList);
    emit(state.copyWith(templateList: state.templateList));
  }

  _showTemplates(ShowTemplatesEvent event, Emitter<MarketState> emit) {
    emit(state.copyWith(showTemplates: event.isShow));
  }
}
