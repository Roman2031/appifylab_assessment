import 'package:flutter_bloc/flutter_bloc.dart';

import 'calendar_event.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc()
      : super(CalendarState(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
          events: {
            DateTime.utc(2025, 11, 2): ['Flutter Bloc Practice'],
            DateTime.utc(2025, 11, 5): ['Team Meeting'],
          },
        )) {
    on<DaySelected>((event, emit) {
      emit(state.copyWith(
        selectedDay: event.selectedDay,
        focusedDay: event.focusedDay,
      ));
    });

    on<LoadEvents>((event, emit) {
      // You could fetch events from API here
    });
  }
}
