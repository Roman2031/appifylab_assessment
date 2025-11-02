part of 'login_bloc.dart';

class LoginState {
  String email = '';
  String password = '';
  bool isSubmitting = false;
  String error = '';

  LoginState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    String? error,
  }) {
    return LoginState()
      ..email = email ?? this.email
      ..password = password ?? this.password
      ..isSubmitting = isSubmitting ?? this.isSubmitting
      ..error = error ?? this.error;
  }
}