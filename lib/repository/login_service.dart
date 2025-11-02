import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginUser({
  required String email,
  required String password,
}) async {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      contentType: Headers.jsonContentType,
    ),
  );
  
  final url = 'https://ezyappteam.ezycourse.com/api/app/student/auth/login';

  try {
    final response = await dio.post(
      url,
      data: {'email': email, 'password': password},
    );

    final token = response.data['token'];

    // Save token
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);

    print('Login successful! Token saved.');
  } catch (e) {
    print('Login failed: $e');
  }
}
