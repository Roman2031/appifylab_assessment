import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/login_service.dart';
import '../../screen/calendar/calendar_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>(_onOpenArticleUrl);
  }



Future<void> _onOpenArticleUrl(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    if (event is EmailChanged) {
      emit(state.copyWith(email: event.email));
    } else if (event is PasswordChanged) {
      emit(state.copyWith(password: event.password));
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(isSubmitting: true));
      try {
        var token = await loginUser(
          email: event.email,
          password: event.password,
        );

        if (token == null) {
          emit(state.copyWith(isSubmitting: false, error: 'Login failed'));
          return;
        }

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token!);

        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(builder: (_) => const CalendarScreen()),
        );
      } catch (e) {
        emit(state.copyWith(isSubmitting: false, error: e.toString()));
      }
    }
  }
}
