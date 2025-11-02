import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/calendar/event_calendar_bloc.dart';
import 'calendar_card.dart';
import 'event_tile.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _EventCalendarPageState();
}

class _EventCalendarPageState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F8FC),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Event Calender',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CalendarCard(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: const [
                    EventTile(
                      time: '01:10 PM - 02:00 PM',
                      title: 'cus',
                      color: Color(0xFF5B6EF5),
                    ),
                    SizedBox(height: 8),
                    EventTile(
                      time: '04:00 PM - 05:00 PM',
                      title: 'custom virtual event - 2025 : A ling nam...',
                      color: Color(0xFF5B6EF5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
