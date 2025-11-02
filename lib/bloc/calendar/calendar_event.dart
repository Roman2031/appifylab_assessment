import 'package:equatable/equatable.dart';
import 'package:table_calendar/table_calendar.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object?> get props => [];
}

class DaySelected extends CalendarEvent {
  final DateTime selectedDay;
  final DateTime focusedDay;

  const DaySelected(this.selectedDay, this.focusedDay);

  @override
  List<Object?> get props => [selectedDay, focusedDay];
}

class LoadEvents extends CalendarEvent {}
class AddEvent extends CalendarEvent {
  final DateTime date;
  final String title;
  final String description;

  const AddEvent({required this.date, required this.title, required this.description});

  @override
  List<Object?> get props => [date, title, description];
}