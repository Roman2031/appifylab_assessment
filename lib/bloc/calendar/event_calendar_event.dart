part of 'event_calendar_bloc.dart';

abstract class EventCalendarEvent extends Equatable {
  const EventCalendarEvent();
  @override
  List<Object> get props => [];
}

class ChangeDateEvent extends EventCalendarEvent {
  final DateTime date;
  const ChangeDateEvent(this.date);
}
