import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/utilities/global.dart';

class CalendarService {
  Future<void> fetchCalendarData() async {

    final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token!);
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(milliseconds: 5000),
        receiveTimeout: Duration(milliseconds: 3000),
        contentType: Headers.jsonContentType,
        headers: {'Authorization': 'Bearer $token!'},
      ),
    );

    // var dataParam = jsonEncode({'email': email, 'password': password});
    // try {
    //   var url = '${baseUrl}student/auth/login';
    //   Response response = await dio.post(Uri.encodeFull(url), data: dataParam);

    //   if (response.statusCode == 200) {
    //     // Save token
    //     final token = response.data['token'];
    //     final prefs = await SharedPreferences.getInstance();
    //     await prefs.setString('auth_token', token);

    //     print('Login successful! Token saved : $token');
    //   }
    // } catch (e) {
    //   throw Exception('Failed to login: ${e.toString()}');
    // }
  }
}
