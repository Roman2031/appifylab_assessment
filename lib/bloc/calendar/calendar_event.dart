part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
  

  @override
  List<Object> get props => [];  
}

class FetchAppointEvent extends CalendarEvent {
  int pageNumber;
  FetchAppointEvent({required this.pageNumber});
}

class AppointonAddEvent extends CalendarEvent {
  AppointmentModel appointment;
  AppointonAddEvent({required this.appointment});
}

