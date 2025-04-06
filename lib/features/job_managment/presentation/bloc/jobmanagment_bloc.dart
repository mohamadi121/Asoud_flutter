import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jobmanagment_event.dart';
part 'jobmanagment_state.dart';

class JobmanagmentBloc extends Bloc<JobmanagmentEvent, JobmanagmentState> {
  JobmanagmentBloc() : super(JobmanagmentInitial()) {
    on<JobmanagmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
