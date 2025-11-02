import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/calendar_model.dart';
import '../../repository/calendar_service.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
   final CalendarService service;

  CalendarBloc(this.service) : super(CalendarInitial()) {

     on<FetchAppointEvent>((event, emit) async {
      emit(CalenderLoading());
      try {
        final appointments = await service.fetchCalendarData(pageNumber: 0);
      } catch (e) {
        emit(CalenderError(e.toString()));
      }
    });
  }
}
