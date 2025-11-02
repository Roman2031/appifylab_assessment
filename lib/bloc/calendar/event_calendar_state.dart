part of 'event_calendar_bloc.dart';

class EventCalendarState extends Equatable {
  final DateTime selectedDate;
  final List<CalendarModel> events;

  const EventCalendarState({required this.selectedDate, required this.events});

  factory EventCalendarState.initial() => EventCalendarState(
        selectedDate: DateTime.now(),
        events: [],
      );

  EventCalendarState copyWith({
    DateTime? selectedDate,
    List<CalendarModel>? events,
  }) {
    return EventCalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      events: events ?? this.events,
    );
  }

  @override
  List<Object?> get props => [selectedDate, events];
}
