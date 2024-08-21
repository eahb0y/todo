import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';

class CalendarHeaderWidget extends StatelessWidget {
  final PageController pageController;
  final String currentDate;
  final int month;

  const CalendarHeaderWidget({
    super.key,
    required this.pageController,
    required this.currentDate,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingHor28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currentDate,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Ink(
                  decoration: const BoxDecoration(
                    color: AppColors.grayNavigator,
                    borderRadius: AppUtils.kBorderRadius64,
                  ),
                  padding: AppUtils.kPaddingAll4,
                  child: const Icon(
                    Icons.navigate_before,
                  ),
                ),
                onPressed: () {
                  if (!(month == 1)) {
                    context.read<HomeBloc>().add(
                          SelectDateCallEvent(
                            month: month - 1,
                          ),
                        );
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              IconButton(
                icon: Ink(
                  decoration: const BoxDecoration(
                    color: AppColors.grayNavigator,
                    borderRadius: AppUtils.kBorderRadius64,
                  ),
                  padding: AppUtils.kPaddingAll4,
                  child: const Icon(
                    Icons.navigate_next,
                  ),
                ),
                onPressed: () {
                  if (!(month == 12)) {
                    context.read<HomeBloc>().add(
                          SelectDateCallEvent(
                            month: month + 1,
                          ),
                        );
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
