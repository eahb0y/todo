import 'package:flutter/cupertino.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';

class ReminderWidget extends StatelessWidget {
  final String title;
  final String desc;

  const ReminderWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppUtils.kPaddingHor28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.eventTitle,
            ),
            AppUtils.kBoxHeight10,
            Text(
              desc,
              style: AppTextStyle.eventDesc,
            ),
          ],
        ),
      ),
    );
  }
}
