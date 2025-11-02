import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bloc/calendar/calendar_bloc.dart';
import '../../bloc/calendar/calendar_event.dart';
import '../../bloc/calendar/calendar_state.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc(),
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          final bloc = context.read<CalendarBloc>();
          return Scaffold(
            appBar: AppBar(title: Center(child: const Text('Event Calendar'))),
            body: Column(
              children: [
                TableCalendar(
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,                    
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    bloc.add(AddEvent(
                      date: selectedDay,
                      title: 'New Event',
                      description: 'Event Description',
                      ));
                  },
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
