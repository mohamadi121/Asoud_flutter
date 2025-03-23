part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {
  const ReservationState();
  
  @override
  List<Object> get props => [];
}

final class ReservationInitial extends ReservationState {}
