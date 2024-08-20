import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/local_source/local_source.dart';
import 'package:todo/injector_container.dart';
import 'package:todo/router/app_routes.dart';
import 'package:todo/router/name_routes.dart';

part 'add_event_event.dart';

part 'add_event_state.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  AddEventBloc()
      : super(const AddEventState(
          selectedColor: 0xFFEE8F00,
          setValue: false,
          isLoading: false,
        )) {
    on<SelectEventColorCallEvent>(_changeColor);
    on<SelectEventTimeCallEvent>(_selectTimeCall);
    on<OnSubmitCallEvent>(_onSubmitCall);
  }

  void _changeColor(
      SelectEventColorCallEvent event, Emitter<AddEventState> emit) {
    emit(state.copyWith(selectedColor: event.color as int));
  }

  void _selectTimeCall(
      SelectEventTimeCallEvent event, Emitter<AddEventState> emit) {
    emit(state.copyWith(setValue: true));
    emit(state.copyWith(selectedTime: event.time));
    emit(state.copyWith(setValue: false));
  }

  Future<void> _onSubmitCall(
      OnSubmitCallEvent event, Emitter<AddEventState> emit) async {
    emit(state.copyWith(isLoading: true));
    print("dateeee22 :: ${event.date}");
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
      arguments: event.date,
    );
    emit(state.copyWith(isLoading: false));
  }
}
