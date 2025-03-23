part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends AuthenticationEvent {
  const SignUp({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class SignIn extends AuthenticationEvent {
  const SignIn({required this.phoneNumber, required this.otp});

  final String phoneNumber;
  final String otp;

  @override
  List<Object> get props => [phoneNumber, otp];
}

class SignOut extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class ToggleTermsCheckboxEvent extends AuthenticationEvent {
  const ToggleTermsCheckboxEvent({required this.isClicked});
  final bool isClicked;

  @override
  List<Object> get props => [isClicked];
}
