import 'package:appifylab_assessment/model/calendar_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_calendar_event.dart';
part 'event_calendar_state.dart';

class EventCalendarBloc extends Bloc<EventCalendarEvent, EventCalendarState> {
  EventCalendarBloc() : super(EventCalendarState.initial()) {
    on<ChangeDateEvent>((event, emit) {
      emit(state.copyWith(selectedDate: event.date));
    });
  }
}
