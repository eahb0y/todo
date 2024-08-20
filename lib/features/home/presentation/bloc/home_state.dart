part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int? selectedYear;
  final DateTime currentDate;
  final int currentDay;
  final int currentMonth;
  final int? selectedMonthPage;
  final bool isLoading;
  final List<Event>? eventsList;

  const HomeState({
    required this.currentDate,
    this.selectedYear,
    required this.currentDay,
    required this.currentMonth,
    this.selectedMonthPage,
    required this.isLoading,
    this.eventsList,
  });

  HomeState copyWith({
    int? selectedYear,
    DateTime? currentDate,
    int? currentDay,
    int? currentMonth,
    int? selectedMonthPage,
    bool? isLoading,
    List<Event>? eventsList,
  }) {
    return HomeState(
      currentDate: currentDate ?? this.currentDate,
      selectedYear: selectedYear ?? this.selectedYear,
      currentDay: currentDay ?? this.currentDay,
      currentMonth: currentMonth ?? this.currentMonth,
      selectedMonthPage: selectedMonthPage ?? this.selectedMonthPage,
      isLoading: isLoading ?? this.isLoading,
      eventsList: eventsList ?? this.eventsList,
    );
  }

  @override
  List<Object?> get props => [
        selectedYear,
        currentDate,
        currentDay,
        currentMonth,
        selectedMonthPage,
        isLoading,
        eventsList,
      ];
}
