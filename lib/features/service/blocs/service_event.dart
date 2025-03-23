part of 'service_bloc.dart';

sealed class ServiceEvent extends Equatable {
  const ServiceEvent();

  @override
  List<Object> get props => [];
}

final class CreateService extends ServiceEvent {}

final class UpdateService extends ServiceEvent {}

final class DeleteService extends ServiceEvent {}
