// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final String phoneNumber;
  final LoginStatus status;
  final bool termStatus;
  final String error;

  const LoginState({
   this.phoneNumber='',
    required this.status,
    required this.termStatus,
    this.error = '',
  });

  factory LoginState.initial() {
    return const LoginState(
      status: LoginStatus.initial, termStatus: false, error: '', phoneNumber: ''
    );
  }

  LoginState copyWith({
    LoginStatus? status,
    bool? termStatus,
    String? error,
    String? phoneNumber,
  }) {
    return LoginState(
      status: status ?? this.status,
      termStatus: termStatus ?? this.termStatus,
      error: error ?? this.error,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, termStatus, error, phoneNumber];

  
}
