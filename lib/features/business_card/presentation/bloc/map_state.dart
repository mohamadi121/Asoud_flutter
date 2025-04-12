part of 'map_bloc.dart';

class LocationState {
  const LocationState({
    required this.status,
    required this.location,
    required this.isSelected,
    required this.message,
  });

  final CWSStatus status;
  final LatLng location;
  final bool isSelected;
  final String message;

  factory LocationState.initial() {
    return const LocationState(
      status: CWSStatus.initial,
      location: LatLng(0, 0),
      isSelected: false,
      message: '',
    );
  }

  LocationState copyWith({
    CWSStatus? status,
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
