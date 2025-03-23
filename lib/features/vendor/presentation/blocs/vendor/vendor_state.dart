part of 'vendor_bloc.dart';

enum VendorStatus { initial, loading, success, failure }

class VendorState extends Equatable {

  final int id;
  final String businessId;
  final String name;
  final String description;
  final int subCategory;
  final String slogan;
  final String message;
  final String marketType;
  final String error;
  final VendorStatus status;

  final XFile logoFile;

  final XFile backgroundFile;

  final XFile sliderFile;
  final VendorStatus sliderStatus;
  final List<SliderModel> sliderList;

  final Color topColor;
  final Color backColor;
  final Color secondColor;

  final Color fontColor;
  final Color secondFontColor;
  final String fontFamily;

  final List<CommentModel> commentList;
  final VendorStatus commentStatus;

  const VendorState({
    required this.id,
    required this.businessId,
    required this.name,
    required this.description,
    required this.slogan,
    required this.message,
    required this.marketType,
    required this.subCategory,
    required this.status,
    required this.error,

    required this.logoFile,
    required this.backgroundFile,

    required this.sliderFile,
    required this.sliderStatus,
    required this.sliderList,

    required this.topColor,
    required this.backColor,
    required this.secondColor,

    required this.fontColor,
    required this.secondFontColor,
    required this.fontFamily,

    required this.commentList,
    required this.commentStatus
  });

  factory VendorState.initial() {
    return VendorState(
      id: 0,
      businessId: '',
      name: '',
      description: '',
      subCategory: 0,
      slogan: '',
      status: VendorStatus.initial,
      message: '',
      marketType: 'shop',
      error: '',

      logoFile: XFile(''),
      backgroundFile: XFile(''),

      sliderFile: XFile(''),
      sliderStatus: VendorStatus.initial,
      sliderList: const [],

      topColor: const Color.fromARGB(255, 10, 25, 146),
      backColor: const Color.fromARGB(255, 255, 255, 255),
      secondColor: const Color.fromARGB(255, 37, 55, 197),

      fontColor: const Color.fromARGB(255, 255, 255, 255),
      secondFontColor: const Color.fromARGB(255, 10, 25, 146),
      fontFamily: '',

      commentList: const [],
      commentStatus: VendorStatus.initial,

    );
  }

  VendorState copyWith({
    int? id,
    String? businessId,
    String? name,
    String? description,
    int? subCategory,
    String? slogan,
    VendorStatus? status,
    String? message,
    String? marketType,
    String? error,
    XFile? logoFile,
    XFile? backgroundFile,

    VendorStatus? sliderStatus,
    XFile? sliderFile,
    List<SliderModel>? sliderList,

    Color? topColor,
    Color? backColor,
    Color? secondColor,

    Color? fontColor,
    Color? secondFontColor,
    String? fontFamily,

    List<CommentModel>? commentList,
    VendorStatus? commentStatus,
  }) {
    return VendorState(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      name: name ?? this.name,
      description: description ?? this.description,
      subCategory: subCategory ?? this.subCategory,
      slogan: slogan ?? this.slogan,
      status: status ?? this.status,
      message: message ?? this.message,
      marketType: marketType ?? this.marketType,
      error: error ?? this.error,

      logoFile: logoFile ?? this.logoFile,
      backgroundFile: backgroundFile ?? this.backgroundFile,

      sliderStatus: sliderStatus ?? this.sliderStatus,
      sliderFile: sliderFile ?? this.sliderFile,
      sliderList: sliderList ?? this.sliderList,

      topColor: topColor ?? this.topColor,
      backColor: backColor ?? this.backColor,
      secondColor: secondColor ?? this.secondColor,

      fontColor: fontColor ?? this.fontColor,
      secondFontColor: secondFontColor ?? this.secondFontColor,
      fontFamily: fontFamily ?? this.fontFamily,

      commentList: commentList ?? this.commentList,
      commentStatus: commentStatus ?? this.commentStatus,

    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      businessId,
      name,
      description,
      subCategory,
      slogan,
      status,
      message,
      marketType,
      error,

      logoFile,
      backgroundFile,

      sliderStatus,
      sliderFile,
      sliderList,

      topColor,
      backColor,
      secondColor,

      fontColor,
      secondFontColor,
      fontFamily,

      commentList,
      commentStatus,

    ];
  }
  
}
