import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/theme/colors/app_colors.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/core/widget/loading/progress_hud.dart';
import 'package:todo/features/add_event/presentation/argument/add_event_argument.dart';
import 'package:todo/features/event_page/presentation/argument/event_page_argument.dart';
import 'package:todo/features/event_page/presentation/bloc/event_bloc.dart';
import 'package:todo/features/event_page/presentation/page/widget/event_app_bar_widget.dart';
import 'package:todo/features/event_page/presentation/page/widget/event_desc_widget.dart';
import 'package:todo/features/event_page/presentation/page/widget/reminder_widget.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/name_routes.dart';

class EventPage extends StatefulWidget {
  final EventPageArgument? argument;

  const EventPage({
    super.key,
    required this.argument,
  });

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    context.read<EventBloc>().add(EventInitialCallEvent(
          id: widget.argument?.id ?? -1,
          event: widget.argument?.event,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: CustomScrollView(
              slivers: [
                EventAppBarWidget(
                  title: state.event?.eventName ?? "",
                  location: state.event?.eventLocation ?? "",
                  time: state.event?.eventTime ?? "",
                  onEdit: () {
                    if (widget.argument?.isFromHome ?? false) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushNamed(
                        context,
                        Routes.addEvent,
                        arguments: AddEventArgument(
                          event: state.event,
                          date: state.event?.eventDate,
                          isEditEvent: true,
                        ),
                      );
                    }
                  },
                ),
                AppUtils.kGap20,
                ReminderWidget(
                  title: AppLocalization.current.reminder,
                  desc: "15 minutes befor",
                ),
                AppUtils.kGap20,
                EventDescWidget(desc: state.event?.eventDescription ?? "")
              ],
            ),
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
              onPressed: () {
                context.read<EventBloc>().add(
                      EventDeleteCallEvent(
                        id: widget.argument?.id ?? -1,
                      ),
                    );
              },
              label: Text(
                AppLocalization.current.delete_event,
                style: AppTextStyle.dayOfWeekText,
              ),
              icon: SvgPicture.asset("assets/svg/ic_trash.svg"),
            ),
          ),
        );
      },
    );
  }
}
