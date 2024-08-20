import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';

class AppBarWidget extends StatelessWidget {
  final DateTime currentDate;
  final int selectedYear;
  final PageController pageController;
  final int selectedMonthPage;

  const AppBarWidget({
    super.key,
    required this.currentDate,
    required this.selectedYear,
    required this.pageController,
    required this.selectedMonthPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          DateFormat('EEEE').format(currentDate),
          style: AppTextStyle.dayOfWeekText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateFormat('d MMMM').format(currentDate),
                style: AppTextStyle.appBarDesc),
            AppUtils.kBoxWidth4,
            DropdownButton<int>(
              underline: const SizedBox(),
              icon: SvgPicture.asset("assets/svg/ic_down.svg"),
              value: selectedYear,
              onChanged: (int? year) {
                context.read<HomeBloc>().add(SelectYearCallEvent(
                      selectedYear: year ?? 0,
                    ));
                if (year != null) {
                  pageController.jumpToPage(selectedMonthPage);
                }
              },
              items: [
                for (int year = DateTime.now().year;
                    year <= DateTime.now().year + 10;
                    year++)
                  DropdownMenuItem<int>(
                    value: year,
                    child: Text(
                      year.toString(),
                      style: AppTextStyle.appBarDesc,
                    ),
                  ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
