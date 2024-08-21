import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';
import 'package:todo/features/home/presentation/page/widget/dotted_events_widget.dart';

class CalendarDaysWidget extends StatefulWidget {
  final PageController pageController;
  final DateTime currentDate;
  final Map<String, List<Event>> eventsList;

  const CalendarDaysWidget({
    super.key,
    required this.pageController,
    required this.currentDate,
    required this.eventsList,
  });

  @override
  State<CalendarDaysWidget> createState() => _CalendarDaysWidgetState();
}

class _CalendarDaysWidgetState extends State<CalendarDaysWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingHor12,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        width: double.infinity,
        child: PageView.builder(
          controller: widget.pageController,
          onPageChanged: (index) {
            context
                .read<HomeBloc>()
                .add(SelectDateCallEvent(month: index + 1));
          },
          itemCount: 12 * 10,
          itemBuilder: (context, pageIndex) {
            DateTime month = DateTime(
              widget.currentDate.year,
              (pageIndex % 12) + 1,
            );
            int daysInMonth = DateTime(month.year, month.month + 1, 0).day;
            DateTime firstDayOfMonth = DateTime(month.year, month.month, 1);
            int weekdayOfFirstDay = firstDayOfMonth.weekday;

            DateTime lastDayOfPreviousMonth =
                firstDayOfMonth.subtract(const Duration(days: 1));
            int daysInPreviousMonth = lastDayOfPreviousMonth.day;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: AppUtils.kPaddingHor4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 2,
              ),
              itemCount: daysInMonth + weekdayOfFirstDay - 1,
              itemBuilder: (context, index) {
                String day = (index - weekdayOfFirstDay + 2) < 10
                    ? "0${index - weekdayOfFirstDay + 2}"
                    : "${index - weekdayOfFirstDay + 2}";
                String currentDate =
                    "${widget.currentDate.year}-${DateFormat("MM").format(widget.currentDate)}-$day";
                if (index < weekdayOfFirstDay - 1) {
                  int previousMonthDay =
                      daysInPreviousMonth - (weekdayOfFirstDay - index) + 2;
                  return Center(
                    child: Text(
                      previousMonthDay.toString(),
                      style: AppTextStyle.flightPreferences,
                    ),
                  );
                } else {
                  DateTime date = DateTime(
                      month.year, month.month, index - weekdayOfFirstDay + 2);
                  String text = date.day.toString();

                  return Center(
                    child: InkWell(
                      borderRadius: AppUtils.kBorderRadius64,
                      onTap: () {
                        context.read<HomeBloc>().add(
                              SelectDateCallEvent(
                                day: index - weekdayOfFirstDay + 2,
                              ),
                            );
                        setState(() {});
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: AppUtils.kBorderRadius64,
                            child: ColoredBox(
                              color: (index - weekdayOfFirstDay + 2) ==
                                      widget.currentDate.day
                                  ? AppColors.lightBlue
                                  : Colors.transparent,
                              child: Padding(
                                padding: AppUtils.kPaddingHor7Ver3,
                                child: Text(
                                  text,
                                  style: (index - weekdayOfFirstDay + 2) ==
                                          widget.currentDate.day
                                      ? AppTextStyle.selectedDaysText
                                      : AppTextStyle.daysText,
                                ),
                              ),
                            ),
                          ),
                          if (widget.eventsList.keys.contains(currentDate))
                            AppUtils.kBoxHeight2,
                          if (widget.eventsList.keys.contains(currentDate))
                            DottedEventsWidget(
                              events: widget.eventsList[currentDate] ?? [],
                            )
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
