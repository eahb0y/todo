import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/home/presentation/bloc/home_bloc.dart';

class CalendarHeaderWidget extends StatelessWidget {
  final bool isLastMonthOfYear;
  final PageController pageController;
  final String currentDate;

  const CalendarHeaderWidget({
    super.key,
    required this.isLastMonthOfYear,
    required this.pageController,
    required this.currentDate,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
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
                    if (pageController.page! > 0) {
                      context.read<HomeBloc>().add(
                            SelectDateCallEvent(
                              month:
                                  (DateTime.tryParse(currentDate)?.month ?? 1),
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
                    if (!isLastMonthOfYear) {
                      context.read<HomeBloc>().add(
                            SelectDateCallEvent(
                              month:
                                  (DateTime.tryParse(currentDate)?.month ?? 1),
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
      ),
    );
  }
}
