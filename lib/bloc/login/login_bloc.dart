import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is PasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is LoginSubmitted) {
      yield state.copyWith(isSubmitting: true);
      try {
        // Simulate API call (replace with actual authentication logic)
        await Future.delayed(const Duration(seconds: 2));
        if (state.email.isEmpty || state.password.isEmpty) {
          throw Exception('Please fill in all fields');
        }
        // On success, you could emit a success state or navigate
        yield state.copyWith(isSubmitting: false, error: '');
      } catch (e) {
        yield state.copyWith(isSubmitting: false, error: e.toString());
      }
    }
  }
}
