part of 'add_event_bloc.dart';

class AddEventState extends Equatable {
  final int selectedColor;
  final bool setValue;
  final String? selectedTime;
  final bool isLoading;

  const AddEventState({
    required this.selectedColor,
    required this.setValue,
    this.selectedTime,
    required this.isLoading,
  });

  AddEventState copyWith({
    int? selectedColor,
    bool? setValue,
    String? selectedTime,
    bool? isLoading,
  }) {
    return AddEventState(
      selectedColor: selectedColor ?? this.selectedColor,
      setValue: setValue ?? this.setValue,
      selectedTime: selectedTime ?? this.selectedTime,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        selectedColor,
        setValue,
        selectedTime,
        isLoading,
      ];
}
