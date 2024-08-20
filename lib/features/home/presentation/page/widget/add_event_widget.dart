import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/name_routes.dart';

class AddEventWidget extends StatelessWidget {
  final String currentDate;

  const AddEventWidget({
    super.key,
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
              AppLocalization.current.schedule,
              style: AppTextStyle.dayOfWeekText,
            ),
            SizedBox(
              width: 103,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppUtils.kBorderRadius10,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.addEvent,
                    arguments: currentDate,
                  );
                },
                child: FittedBox(
                  child: Text(
                    AppLocalization.current.add_event,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
