part of 'map_bloc.dart';

abstract class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DetermineCurrentPosition extends LocationEvent {}

class UpdateSelectedLocation extends LocationEvent {
  final LatLng location;

  UpdateSelectedLocation(this.location);

  @override
  List<Object> get props => [location];
}

class SaveLocation extends LocationEvent {}

class ReadSavedLocation extends LocationEvent {}
