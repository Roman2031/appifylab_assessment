import 'package:equatable/equatable.dart';

class CalendarState extends Equatable {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final Map<DateTime, List<String>> events;

  const CalendarState({
    required this.selectedDay,
    required this.focusedDay,
    required this.events,
  });

  CalendarState copyWith({
    DateTime? selectedDay,
    DateTime? focusedDay,
    Map<DateTime, List<String>>? events,
  }) {
    return CalendarState(
      selectedDay: selectedDay ?? this.selectedDay,
      focusedDay: focusedDay ?? this.focusedDay,
      events: events ?? this.events,
    );
  }

  @override
  List<Object?> get props => [selectedDay, focusedDay, events];
}
