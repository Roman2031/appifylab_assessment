
part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();
  
  @override
  List<Object> get props => [];
}

class CalendarInitial extends CalendarState {}
class CalenderLoading extends CalendarState {}
class CalenderLoaded extends CalendarState {}
class CalenderError extends CalendarState {
   final String message;

  CalenderError(this.message);

  @override
  List<Object> get props => [message];
}
