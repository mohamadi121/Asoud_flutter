part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SendOtp extends LoginEvent {
  final String phone;
  
  const SendOtp({required this.phone});
}

class VerifyOtp extends LoginEvent {
  final String phone;
  final String otp;
  const VerifyOtp({required this.phone, required this.otp});
}

class ToggleTermsCheckboxEvent extends LoginEvent {
  final bool isClicked;
  const ToggleTermsCheckboxEvent({required this.isClicked});
}

class Logout extends LoginEvent {}
