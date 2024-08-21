import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/functions/base_functions.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';
import 'package:todo/features/event_page/presentation/argument/event_page_argument.dart';
import 'package:todo/router/name_routes.dart';

class EventsWidget extends StatelessWidget {
  final List<Event> events;

  const EventsWidget({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: AppUtils.kPaddingHor28,
      shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) => InkWell(
          borderRadius: AppUtils.kBorderRadius10,
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.event,
              arguments: EventPageArgument(
                id: events[index].id ?? -1
              ),
            );
          },
          child: ClipRRect(
            borderRadius: AppUtils.kBorderRadius10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ColoredBox(
                  color: Color(Functions.getColor(events[index].eventColor)),
                  child: const SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: AppUtils.kPaddingAll12,
                  decoration: BoxDecoration(
                      color: Color(events[index].eventColor),
                      borderRadius: AppUtils.kBorderRadiusBottom10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        events[index].eventName,
                        style: AppTextStyle.eventTitleText.copyWith(
                          color: Color(
                            Functions.getColor(events[index].eventColor),
                          ),
                        ),
                      ),
                      Text(
                        events[index].eventLocation,
                        style: AppTextStyle.eventCardLocation.copyWith(
                          color: Color(
                            Functions.getColor(events[index].eventColor),
                          ),
                        ),
                      ),
                      AppUtils.kBoxHeight12,
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/ic_time.svg",
                            colorFilter: ColorFilter.mode(
                              Color(
                                Functions.getColor(events[index].eventColor),
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                          AppUtils.kBoxWidth4,
                          Text(
                            events[index].eventTime,
                            style: AppTextStyle.selectedDaysText.copyWith(
                              color: Color(
                                Functions.getColor(events[index].eventColor),
                              ),
                            ),
                          ),
                          AppUtils.kBoxWidth10,
                          SvgPicture.asset(
                            "assets/svg/ic_location.svg",
                            colorFilter: ColorFilter.mode(
                              Color(
                                Functions.getColor(events[index].eventColor),
                              ),
                              BlendMode.srcIn,
                            ),
                          ),
                          AppUtils.kBoxWidth4,
                          Text(
                            events[index].eventLocation,
                            style: AppTextStyle.selectedDaysText.copyWith(
                              color: Color(
                                Functions.getColor(events[index].eventColor),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (_, __) => AppUtils.kBoxHeight14,
        itemCount: events.length,
      );
  }
}
