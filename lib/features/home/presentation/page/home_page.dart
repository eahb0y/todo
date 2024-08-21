import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';
import 'package:todo/features/home/presentation/micin/home_mixin.dart';
import 'package:todo/features/home/presentation/page/widget/add_event_widget.dart';
import 'package:todo/features/home/presentation/page/widget/app_bar_widget.dart';
import 'package:todo/features/home/presentation/page/widget/calendar_days_widget.dart';
import 'package:todo/features/home/presentation/page/widget/calendar_header_widget.dart';
import 'package:todo/features/home/presentation/page/widget/events_widget.dart';
import 'package:todo/features/home/presentation/page/widget/week_days_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  void initState() {
    initController(DateTime.now().month);
    context.read<HomeBloc>().add(const InitialCallEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  "assets/svg/ic_notification.svg",
                  height: 32,
                  width: 32,
                ),
              ),
              AppUtils.kBoxWidth28
            ],
            bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 40),
                child: AppBarWidget(
                  pageController: pageController,
                  currentDate: state.currentDate,
                  selectedMonthPage: state.selectedMonthPage ?? 0,
                  selectedYear: state.currentDate.year,
                )),
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CalendarHeaderWidget(
                pageController: pageController,
                currentDate: DateFormat("MMMM").format(state.currentDate),
                month: state.currentDate.month,
              ),
              AppUtils.kBoxHeight20,
              const WeekDaysWidget(),
              AppUtils.kBoxHeight20,
              CalendarDaysWidget(
                currentDate: state.currentDate,
                pageController: pageController,
                eventsList: state.eventsList ?? {},
              ),
              AddEventWidget(
                currentDate: state.currentDate.toString(),
              ),
              AppUtils.kBoxHeight20,
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    EventsWidget(
                      events: state.eventsList?[
                              state.currentDate.toString().substring(0, 10)] ??
                          [],
                    ),
                    AppUtils.kBoxHeight10
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}