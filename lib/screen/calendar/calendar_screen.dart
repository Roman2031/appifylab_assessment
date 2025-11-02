import 'package:appifylab_assessment/model/calendar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bloc/calendar/calendar_bloc.dart';
import '../../repository/calendar_service.dart';

class CalendarScreen extends StatefulWidget {
  int pageNumber;
  CalendarScreen({super.key, required this.pageNumber});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CalendarBloc>().add(FetchAppointEvent(pageNumber: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarBloc(CalendarService()),
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
                    //bloc.add(AppointonAddEvent(appointment: AppointmentModel()));
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
