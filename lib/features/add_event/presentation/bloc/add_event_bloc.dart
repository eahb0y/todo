import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/local_source/local_source.dart';
import 'package:todo/features/event_page/presentation/argument/event_page_argument.dart';
import 'package:todo/injector_container.dart';
import 'package:todo/router/app_routes.dart';
import 'package:todo/router/name_routes.dart';

part 'add_event_event.dart';
part 'add_event_state.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  AddEventBloc()
      : super(const AddEventState(
          selectedColor: 0xFFf3d1c7,
          setValue: false,
          isLoading: false,
          onSubmit: false,
        )) {
    on<SelectEventColorCallEvent>(_changeColor);
    on<SelectEventTimeCallEvent>(_selectTimeCall);
    on<OnSubmitCallEvent>(_onSubmitCall);
    on<GetEventDataCallEvent>(_getEventDataCall);
  }

  void _changeColor(
      SelectEventColorCallEvent event, Emitter<AddEventState> emit) {
    emit(state.copyWith(selectedColor: event.color as int));
  }

  void _selectTimeCall(
      SelectEventTimeCallEvent event, Emitter<AddEventState> emit) {
    emit(state.copyWith(selectedTime: event.time));
  }

  Future<void> _onSubmitCall(
      OnSubmitCallEvent event, Emitter<AddEventState> emit) async {
    if (event.eventName.isEmpty && event.eventDesc.isEmpty) {
      emit(state.copyWith(onSubmit: true));
      return;
    }
    if (event.eventLocation.isEmpty && (state.selectedTime?.isEmpty ?? true)) {
      emit(state.copyWith(onSubmit: true));
      return;
    }
    emit(state.copyWith(isLoading: true));
    if (event.isEdit) {
      await sl<LocalSource>().updateEventById(
          event.id,
          Event(
            id: event.id,
            eventName: event.eventName,
            eventDescription: event.eventDesc,
            eventLocation: event.eventLocation,
            eventColor: state.selectedColor,
            eventTime: state.selectedTime ?? "",
            eventDate: event.date,
          ));
      Navigator.pushNamedAndRemoveUntil(
        rootNavigatorKey.currentContext!,
        Routes.home,
        (route) => false,
      );
    } else {
      await sl<LocalSource>().insertEvent(Event(
        eventName: event.eventName,
        eventDescription: event.eventDesc,
        eventLocation: event.eventLocation,
        eventColor: state.selectedColor,
        eventTime: state.selectedTime ?? "",
        eventDate: event.date,
      ));
      Navigator.pushNamed(
        rootNavigatorKey.currentContext!,
        Routes.event,
        arguments: EventPageArgument(
          id: event.id,
          event: Event(
            eventName: event.eventName,
            eventDescription: event.eventDesc,
            eventLocation: event.eventLocation,
            eventColor: state.selectedColor,
            eventTime: state.selectedTime ?? "",
            eventDate: event.date,
          ),
        ),
      );
    }

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _getEventDataCall(
      GetEventDataCallEvent event, Emitter<AddEventState> emit) async {
    emit(state.copyWith(isLoading: true, setValue: true));
    var result = await sl<LocalSource>().getEventById(event.eventId);
    emit(state.copyWith(
        event: result,
        selectedTime: result?.eventTime,
        selectedColor: result?.eventColor));
    emit(state.copyWith(isLoading: false, setValue: false));
  }
}
