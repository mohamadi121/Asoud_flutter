part of 'jobmanagment_bloc.dart';

enum CWSStatus { initial, loading, success, failure }

class JobmanagmentState {
  final int activeTabIndex;
  final CWSStatus status;
  final String error;
  final int activeCategoryIndex;
  final List<CategoryModel> categoryList;
  final List<MainSubCategoryModel> mainSubCategoryList;
  final String activeSubCategoryIndex;
  final List<CategoryModel> subCategoryList;
  final String selectedCategoryName;

  const JobmanagmentState({
    required this.status,
    required this.error,
    required this.activeTabIndex,

    required this.selectedCategoryName,
    required this.activeCategoryIndex,
    required this.categoryList,
    required this.mainSubCategoryList,
    required this.activeSubCategoryIndex,
    required this.subCategoryList,
  });

  factory JobmanagmentState.initial() {
    return JobmanagmentState(
      status: CWSStatus.initial,
      error: "",
      activeTabIndex: 0,
      selectedCategoryName: "",
      activeCategoryIndex: -1,
      categoryList: const [],
      mainSubCategoryList: const [],
      activeSubCategoryIndex: "-1",
      subCategoryList: const [],
    );
  }

  JobmanagmentState copyWith({
    CWSStatus? status,
    String? error,
    int? activeTabIndex,
    int? activeCategoryIndex,
    List<CategoryModel>? categoryList,
    List<MainSubCategoryModel>? mainSubCategoryList,
    String? activeSubCategoryIndex,
    List<CategoryModel>? subCategoryList,
    String? selectedCategoryName,
  }) {
    return JobmanagmentState(
      status: status ?? this.status,
      error: error ?? this.error,
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
      selectedCategoryName: selectedCategoryName ?? this.selectedCategoryName,

      activeCategoryIndex: activeCategoryIndex ?? this.activeCategoryIndex,
      categoryList: categoryList ?? this.categoryList,
      mainSubCategoryList: mainSubCategoryList ?? this.mainSubCategoryList,
      activeSubCategoryIndex:
          activeSubCategoryIndex ?? this.activeSubCategoryIndex,
      subCategoryList: subCategoryList ?? this.subCategoryList,
    );
  }
}
