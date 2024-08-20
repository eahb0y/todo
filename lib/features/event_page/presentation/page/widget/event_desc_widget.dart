import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/generated/l10n.dart';

class EventDescWidget extends StatelessWidget {
  final String desc;

  const EventDescWidget({
    super.key,
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
              AppLocalization.current.desc,
              style: AppTextStyle.eventTitle,
            ),
            AppUtils.kBoxHeight10,
            Text(
              desc,
              style: AppTextStyle.eventDescGrey,
            ),
          ],
        ),
      ),
    );
  }
}
