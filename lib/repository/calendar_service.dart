import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/utilities/global.dart';
import '../model/calendar_model.dart';

class CalendarService {
  Future<List<AppointmentModel>> fetchCalendarData({required int pageNumber}) async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('auth_token');
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(milliseconds: 5000),
        receiveTimeout: Duration(milliseconds: 3000),
        contentType: Headers.jsonContentType,
        headers: {'Authorization': 'Bearer $token!'},
      ),
    );
    try {
      var url = '$baseUrl/student/order/getMyEventList-calender?month_diff=$pageNumber';
      Response response = await dio.get(Uri.encodeFull(url));

      if (response.statusCode == 200) {
        var result = response.data as List;
        List<AppointmentModel> listData = result
            .map((tagJson) => AppointmentModel.fromJson(tagJson))
            .toList();

        return listData;
      } else {
        throw Exception(
          'Failed to fetch calendar data: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch calendar data: $e');
    }
  }
}
