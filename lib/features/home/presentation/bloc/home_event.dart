part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class SelectYearCallEvent extends HomeEvent {
  final int? selectedYear;

  const SelectYearCallEvent({required this.selectedYear});

  @override
  List<Object?> get props => [selectedYear];
}

final class SelectMonthCallEvent extends HomeEvent {
  final int selectMonth;

  const SelectMonthCallEvent({required this.selectMonth});

  @override
  List<Object?> get props => [selectMonth];
}

final class SelectDateCallEvent extends HomeEvent {
  final int? year;
  final int? month;
  final int? day;

  const SelectDateCallEvent({
    this.year,
    this.month,
    this.day,
  });

  @override
  List<Object?> get props => [
        year,
        month,
        day,
      ];
}
