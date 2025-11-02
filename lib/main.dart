import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/login/login_bloc.dart';
import 'screen/calendar/calendar_screen.dart';
import 'screen/login_screen.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  var token = await prefs.getString('auth_token');
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  String? token;
  MyApp({super.key,required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'Ezycourse',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFF00695C,
        ), // Teal background matching the screenshot
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(
            0xFF004D40,
          ), // Slightly darker teal for input fields
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(color: Colors.white70),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFEB3B), // Yellow button
            foregroundColor: Colors.black,
            minimumSize: const Size(double.infinity, 56.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFFFFEB3B); // Yellow when checked
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(Colors.white),
          side: const BorderSide(color: Colors.white70),
        ),
      ),
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: token == null ? const LoginScreen(): const CalendarScreen(),
      ),
    );
  }
}
