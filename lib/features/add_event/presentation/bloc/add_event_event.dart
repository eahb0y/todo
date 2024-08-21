part of 'add_event_bloc.dart';

sealed class AddEventEvent extends Equatable {
  const AddEventEvent();
}

final class SelectEventColorCallEvent extends AddEventEvent {
  final Object? color;

  const SelectEventColorCallEvent({required this.color});

  @override
  List<Object?> get props => [color];
}

final class SelectEventTimeCallEvent extends AddEventEvent {
  final String time;

  const SelectEventTimeCallEvent({required this.time});

  @override
  List<Object?> get props => [time];
}

final class OnSubmitCallEvent extends AddEventEvent {
  final String eventName;
  final String eventDesc;
  final String eventLocation;
  final String date;
  final int id;
  final bool isEdit;

  const OnSubmitCallEvent({
    required this.eventName,
    required this.eventDesc,
    required this.eventLocation,
    required this.date,
    required this.id,
    required this.isEdit,
  });

  @override
  List<Object?> get props => [
        eventName,
        eventDesc,
        eventLocation,
        date,
        id,
        isEdit,
      ];
}

final class GetEventDataCallEvent extends AddEventEvent {
  final int eventId;

  const GetEventDataCallEvent({required this.eventId});

  @override
  List<Object?> get props => [eventId];
}
