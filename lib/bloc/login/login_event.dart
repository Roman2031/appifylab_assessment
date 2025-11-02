part of 'login_bloc.dart';

abstract class LoginEvent {}

class EmailChanged extends LoginEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {
  BuildContext context;
  String email;
  String password;
  LoginSubmitted({required this.context, required this.email,required this.password});
}