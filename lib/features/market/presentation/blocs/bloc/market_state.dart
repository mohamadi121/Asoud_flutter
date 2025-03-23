part of 'market_bloc.dart';

enum MarketStatus { initial, loading, success, failure }

class MarketState extends Equatable{

  final List templateList;
  final bool showTemplates;
  final int templateIndex;

  const MarketState({

    required this.templateList,
    required this.showTemplates,
    required this.templateIndex,

  });

  factory MarketState.initial() {
    return const MarketState(

      templateList: [],
      showTemplates: false,
      templateIndex : -1,

    );
  }

  MarketState copyWith({

    List? templateList,
    bool? showTemplates,
    int? templateIndex,

  }) {
    return MarketState(

      templateList: templateList ?? this.templateList,
      showTemplates: showTemplates ?? this.showTemplates,
      templateIndex: templateIndex ?? this.templateIndex,

    );
  }


  @override
  List<Object> get props {
    return [

      templateList,
      showTemplates,
      templateIndex,

    ];
  }
}

// final class MarketInitial extends MarketState {}
