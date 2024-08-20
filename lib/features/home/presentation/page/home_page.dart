import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';
import 'package:todo/features/home/presentation/micin/home_mixin.dart';
import 'package:todo/features/home/presentation/page/widget/app_bar_widget.dart';
import 'package:todo/features/home/presentation/page/widget/calendar_days_widget.dart';
import 'package:todo/features/home/presentation/page/widget/calendar_header_widget.dart';
import 'package:todo/features/home/presentation/page/widget/week_days_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  void initState() {
    initController();
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
              )
            ],
            bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 30),
                child: AppBarWidget(
                  pageController: pageController,
                  currentDate: state.currentDate,
                  selectedMonthPage: state.selectedMonthPage ?? 0,
                  selectedYear: state.currentDate.year,
                )),
          ),
          body: CustomScrollView(
            slivers: [
              CalendarHeaderWidget(
                isLastMonthOfYear: state.currentDate.month == 12,
                pageController: pageController,
                currentDate: DateFormat("MMMM").format(state.currentDate),
              ),
              AppUtils.kGap20,
              const WeekDaysWidget(),
              AppUtils.kGap20,
              CalendarDaysWidget(
                currentDate: state.currentDate,
                pageController: pageController,
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
