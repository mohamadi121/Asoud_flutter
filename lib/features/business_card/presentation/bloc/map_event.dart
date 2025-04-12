part of 'map_bloc.dart';

abstract class LocationEvent {}

class DetermineCurrentPosition extends LocationEvent {}

class UpdateSelectedLocation extends LocationEvent {
  final LatLng location;

  UpdateSelectedLocation(this.location);
}

class SaveLocation extends LocationEvent {}

class ReadSavedLocation extends LocationEvent {}
