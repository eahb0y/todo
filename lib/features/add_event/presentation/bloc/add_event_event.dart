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

  const OnSubmitCallEvent({
    required this.eventName,
    required this.eventDesc,
    required this.eventLocation,
    required this.date,
  });

  @override
  List<Object?> get props => [
        eventName,
        eventDesc,
        eventLocation,
        date,
      ];
}
