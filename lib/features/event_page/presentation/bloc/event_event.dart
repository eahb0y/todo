part of 'event_bloc.dart';

sealed class EventEvent extends Equatable {
  const EventEvent();
}

final class EventInitialCallEvent extends EventEvent {
  final int id;
  final Event? event;

  const EventInitialCallEvent({
    required this.id,
    required this.event,
  });

  @override
  List<Object?> get props => [id, event];
}

final class EventDeleteCallEvent extends EventEvent {
  final int id;

  const EventDeleteCallEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
