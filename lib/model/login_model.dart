class LoginModel {
String email = '';
  String password = '';
  bool isSubmitting = false;
  String error = '';

  LoginModel copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    String? error,
  }) {
    return LoginModel()
      ..email = email ?? this.email
      ..password = password ?? this.password
      ..isSubmitting = isSubmitting ?? this.isSubmitting
      ..error = error ?? this.error;
  }

}