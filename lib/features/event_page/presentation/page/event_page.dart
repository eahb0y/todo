import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/event_page/presentation/page/widget/event_app_bar_widget.dart';
import 'package:todo/features/event_page/presentation/page/widget/event_desc_widget.dart';
import 'package:todo/features/event_page/presentation/page/widget/reminder_widget.dart';
import 'package:todo/generated/l10n.dart';

class EventPage extends StatelessWidget {
  final String date;

  const EventPage({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const EventAppBarWidget(
            title: "Watching Football",
            location: "Manchester United vs Arsenal (Premiere League)",
            time: "17:00 - 18:30",
          ),
          AppUtils.kGap20,
          ReminderWidget(
            title: AppLocalization.current.reminder,
            desc: "15 minutes befor",
          ),
          AppUtils.kGap20,
          const EventDescWidget(
            desc:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. ",
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: AppUtils.kPaddingL28R28B28,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.red50,
            shape: const RoundedRectangleBorder(
              borderRadius: AppUtils.kBorderRadius10,
            ),
          ),
          onPressed: () {},
          label: Text(
            AppLocalization.current.delete_event,
            style: AppTextStyle.dayOfWeekText,
          ),
          icon: SvgPicture.asset("assets/svg/ic_trash.svg"),
        ),
      ),
    );
  }
}
