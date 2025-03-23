part of 'splash_bloc.dart';

enum SplashStatus { initial, loading, exist, notExist, error }

class SplashState extends Equatable {
  final SplashStatus status;
  const SplashState({required this.status});

  factory SplashState.initial() {
    return const SplashState(status: SplashStatus.initial);
  }
  SplashState copyWith({
    SplashStatus? status,
  }) {
    return SplashState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];

  @override
  bool get stringify => true;
}
