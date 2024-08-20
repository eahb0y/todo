import 'package:flutter/material.dart';
import 'package:todo/core/theme/colors/app_colors.dart';

class AppTextStyle{
  AppTextStyle._();

  static const flightPreferences = TextStyle(
    color: AppColors.weekDaysColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const daysText = TextStyle(
    color: AppColors.daysColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const selectedDaysText = TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const dayOfWeekText = TextStyle(
    color: AppColors.daysColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const appBarDesc = TextStyle(
    color: AppColors.daysColor,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const textField = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );
  static const textFieldTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
  );
  static const textButtonEdit = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const eventName = TextStyle(
    color: AppColors.white,
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );
  static const eventLocation = TextStyle(
    color: AppColors.white,
    fontSize: 8,
    fontWeight: FontWeight.w400,
  );
  static const eventTime = TextStyle(
    color: AppColors.white,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static const eventTitle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const eventDesc = TextStyle(
    color: AppColors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const eventDescGrey = TextStyle(
    color: AppColors.grey99,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}