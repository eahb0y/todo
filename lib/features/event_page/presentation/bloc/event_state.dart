part of 'event_bloc.dart';

class EventState extends Equatable {
  final bool isLoading;
  final Event? event;

  const EventState({
    required this.isLoading,
    this.event,
  });

  EventState copyWith({
    bool? isLoading,
    Event? event,
  }) {
    return EventState(
        isLoading: isLoading ?? this.isLoading, event: event ?? this.event);
  }

  @override
  List<Object?> get props => [
        isLoading,
        event,
      ];
}
