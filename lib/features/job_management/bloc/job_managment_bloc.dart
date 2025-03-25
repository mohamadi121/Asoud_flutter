import 'package:asood/core/http_client/api_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'job_managment_event.dart';
part 'job_managment_state.dart';

class JobManagmentBloc extends Bloc<JobManagmentEvent, JobManagmentState> {
  JobManagmentBloc() : super(JobManagmentState.initial()) {
    on<FetchJobs>(_onFetchJobs);
    on<AddJob>(_onAddJob);
    on<EditJob>(_onEditJob);
    on<FetchCategories>(_onFetchCategories);
    on<AddCategory>(_onAddCategory);
    on<EditCategory>(_onEditCategory);
    on<FetchSubCategories>(_onFetchSubCategories);
    on<AddSubCategory>(_onAddSubCategory);
    on<EditSubCategory>(_onEditSubCategory);
  }

  void _onFetchJobs(FetchJobs event, Emitter<JobManagmentState> emit) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onAddJob(AddJob event, Emitter<JobManagmentState> emit) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onEditJob(EditJob event, Emitter<JobManagmentState> emit) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onFetchCategories(
    FetchCategories event,
    Emitter<JobManagmentState> emit,
  ) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onAddCategory(AddCategory event, Emitter<JobManagmentState> emit) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {}
  }

  void _onEditCategory(EditCategory event, Emitter<JobManagmentState> emit) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onFetchSubCategories(
    FetchSubCategories event,
    Emitter<JobManagmentState> emit,
  ) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onAddSubCategory(
    AddSubCategory event,
    Emitter<JobManagmentState> emit,
  ) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _onEditSubCategory(
    EditSubCategory event,
    Emitter<JobManagmentState> emit,
  ) {
    try {
      emit(state.copyWith(status: Status.loading));
      final res = Success();
      if (res is Success) {
        emit(state.copyWith(status: Status.success));
      } else {}
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
