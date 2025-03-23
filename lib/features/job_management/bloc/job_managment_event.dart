part of 'job_managment_bloc.dart';

sealed class JobManagmentEvent extends Equatable {
  const JobManagmentEvent();

  @override
  List<Object> get props => [];
}

class FetchJobs extends JobManagmentEvent {}

class FetchCategories extends JobManagmentEvent {}

class FetchSubCategories extends JobManagmentEvent {
  final String categoryId;
  const FetchSubCategories({required this.categoryId});

}

class AddJob extends JobManagmentEvent {
  final String title;
  final String description;
  final String categoryId;
  final String subCategoryId;
  const AddJob({
    required this.title,
    required this.description,
    required this.categoryId,
    required this.subCategoryId,
  });
}

class AddCategory extends JobManagmentEvent {
  final String title;
  const AddCategory({required this.title});
}

class AddSubCategory extends JobManagmentEvent {
  final String title;
  final String categoryId;
  const AddSubCategory({required this.title, required this.categoryId});
}

class EditJob extends JobManagmentEvent {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String subCategoryId;
  const EditJob({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.subCategoryId,
  });
}

class EditCategory extends JobManagmentEvent {
  final String id;
  final String title;
  const EditCategory({required this.id, required this.title});
}

class EditSubCategory extends JobManagmentEvent {
  final String id;
  final String title;
  final String categoryId;
  const EditSubCategory({required this.id, required this.title, required this.categoryId});
}
