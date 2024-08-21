import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/local_source/local_source.dart';
import 'package:todo/injector_container.dart';
import 'package:todo/router/app_routes.dart';
import 'package:todo/router/name_routes.dart';

part 'event_event.dart';

part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc()
      : super(const EventState(
          isLoading: false,
        )) {
    on<EventInitialCallEvent>(_getEventById);
    on<EventDeleteCallEvent>(_deleteEvent);
  }

  Future<void> _getEventById(
      EventInitialCallEvent event, Emitter<EventState> emit) async {
    if (event.event != null) {
      emit(state.copyWith(isLoading: true));
      emit(state.copyWith(event: event.event, isLoading: false));
      return;
    }else{
      emit(state.copyWith(isLoading: true));
      var result = await sl<LocalSource>().getEventById(event.id);
      emit(state.copyWith(event: result, isLoading: false));
    }

  }

  Future<void> _deleteEvent(
      EventDeleteCallEvent event, Emitter<EventState> emit) async {
    emit(state.copyWith(isLoading: true));
    await sl<LocalSource>().deleteEventById(event.id);
    emit(state.copyWith(isLoading: false));
    Navigator.pushNamedAndRemoveUntil(
      rootNavigatorKey.currentContext!,
      Routes.home,
      (route) => false,
    );
  }
}
