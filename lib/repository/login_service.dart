import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/utilities/global.dart';

Future<String?> loginUser({
  required String email,
  required String password,
}) async {
  String? token;
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 3000),
      contentType: Headers.jsonContentType,
    ),
  );

  final url = '$baseUrl/student/auth/login';

  try {
    final response = await dio.post(
      url,
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      token = response.data['token'];
      print('Login successful! Token saved.');
    }

    return token;
  } catch (e) {
    print('Login failed: $e');
  }
}
