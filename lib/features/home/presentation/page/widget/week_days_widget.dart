import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';

class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildWeekDay('Mon'),
          _buildWeekDay('Tue'),
          _buildWeekDay('Wed'),
          _buildWeekDay('Thu'),
          _buildWeekDay('Fri'),
          _buildWeekDay('Sat'),
          _buildWeekDay('Sun'),
        ],
      ),
    );
  }
}

Widget _buildWeekDay(String day) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Text(
      day,
      style: AppTextStyle.flightPreferences,
    ),
  );
}
