part of 'map_bloc.dart';

enum Status { initial, loading, loaded, error }

class LocationState extends Equatable {
  const LocationState({
    required this.status,
    required this.location,
    required this.isSelected,
    required this.message,
  });

  final Status status;
  final LatLng location;
  final bool isSelected;
  final String message;

  factory LocationState.initial() {
    return const LocationState(
      status: Status.initial,
      location: LatLng(0, 0),
      isSelected: false,
      message: '',
    );
  }
  @override
  List<Object> get props => [status, location, isSelected, message];

  LocationState copyWith({
    Status? status,
    LatLng? location,
    bool? isSelected,
    String? message,
  }) {
    return LocationState(
      status: status ?? this.status,
      location: location ?? this.location,
      isSelected: isSelected ?? this.isSelected,
      message: message ?? this.message,
    );
  }
}
