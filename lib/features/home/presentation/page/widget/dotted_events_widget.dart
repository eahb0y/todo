import 'package:flutter/material.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/utils/app_utils.dart';

class DottedEventsWidget extends StatelessWidget {
  final List<Event> events;

  const DottedEventsWidget({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    print(events.length);
    print(events.first.eventDate);
    return SizedBox(
      height: 4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) => ColoredBox(
          color: Color(events[index].eventColor),
          child: Ink(
            height: 4,
            width: 4,
            decoration: const BoxDecoration(
              borderRadius: AppUtils.kBorderRadius64,
            ),
          ),
        ),
        separatorBuilder: (_, __) => AppUtils.kBoxWidth4,
        itemCount: events.length,
      ),
    );
  }
}
