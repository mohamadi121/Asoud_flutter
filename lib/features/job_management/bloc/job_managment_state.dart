
part of 'job_managment_bloc.dart';

enum Status { initial, loading, success, failure }
class JobManagmentState extends Equatable {
  final Status status;
  final List jobs;
  final List categories;
  final List subCategories;
  const JobManagmentState({
    this.status = Status.initial,
    required this.jobs,
    required this.categories,
    required this.subCategories,
  });

  factory JobManagmentState.initial() {
    return const JobManagmentState(
      status: Status.initial,
      jobs: [],
      categories: [],
      subCategories: [],
    );
  }

  @override
  List<Object> get props => [status,jobs, categories, subCategories];

  JobManagmentState copyWith({
    Status? status,
    List? jobs,
    List? categories,
    List? subCategories,
  }) {
    return JobManagmentState(
      status: status ?? this.status,
      jobs: jobs ?? this.jobs,
      categories: categories ?? this.categories,
      subCategories: subCategories ?? this.subCategories,
    );
  }
}
