part of 'add_event_bloc.dart';

class AddEventState extends Equatable {
  final int selectedColor;
  final bool setValue;
  final String? selectedTime;
  final bool isLoading;
  final Event? event;
  final bool onSubmit;

  const AddEventState({
    required this.selectedColor,
    required this.setValue,
    this.selectedTime,
    required this.isLoading,
    this.event,
    required this.onSubmit,
  });

  AddEventState copyWith({
    int? selectedColor,
    bool? setValue,
    String? selectedTime,
    bool? isLoading,
    Event? event,
    bool? onSubmit,
  }) {
    return AddEventState(
      selectedColor: selectedColor ?? this.selectedColor,
      setValue: setValue ?? this.setValue,
      selectedTime: selectedTime ?? this.selectedTime,
      isLoading: isLoading ?? this.isLoading,
      event: event ?? this.event,
      onSubmit: onSubmit ?? this.onSubmit,
    );
  }

  @override
  List<Object?> get props => [
        selectedColor,
        setValue,
        selectedTime,
        isLoading,
        event,
        onSubmit,
      ];
}
