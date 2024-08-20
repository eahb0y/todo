import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/local_source/local_source.dart';
import 'package:todo/injector_container.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
          currentDate: DateTime.now(),
          currentDay: DateTime.now().day,
          currentMonth: DateTime.now().month,
          selectedYear: DateTime.now().year,
          isLoading: false,
        )) {
    on<SelectYearCallEvent>(_changeYearCall);
    on<SelectMonthCallEvent>(_changeMonthCall);
    on<SelectDateCallEvent>(_selectDateCall);
    on<InitialCallEvent>(_initialCall);
  }

  void _changeYearCall(SelectYearCallEvent event, Emitter<HomeState> emit) {
    int monthIndex = (12 * (DateTime.now().year - (event.selectedYear ?? 0)) +
            state.currentDate.month -
            1)
        .toInt();
    emit(state.copyWith(
      selectedYear: event.selectedYear,
      selectedMonthPage: monthIndex,
    ));
  }

  void _changeMonthCall(SelectMonthCallEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentMonth: event.selectMonth));
  }

  void _selectDateCall(SelectDateCallEvent event, Emitter<HomeState> emit) {
    print("selected month ${event.month}");
    emit(state.copyWith(
        currentDate: DateTime(
      event.year ?? state.currentDate.year,
      event.month ?? state.currentDate.month,
      event.day ?? state.currentDate.day,
    )));
  }

  Future<void> _initialCall(
      InitialCallEvent event, Emitter<HomeState> emit) async {
    List<Event> listOfEvents = [];
    emit(state.copyWith(isLoading: true));
    List<Event> result = await sl<LocalSource>().getAllEvents();
    print("resulttt :: ${result.length}");
    listOfEvents.addAll(result);
    emit(state.copyWith(eventsList: [...listOfEvents], isLoading: false));
  }
}
