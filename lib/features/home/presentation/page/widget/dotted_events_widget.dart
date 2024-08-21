import 'package:flutter/material.dart';
import 'package:todo/core/event/model/event_model.dart';
import 'package:todo/core/functions/base_functions.dart';
import 'package:todo/core/utils/app_utils.dart';

class DottedEventsWidget extends StatelessWidget {
  final List<Event> events;

  const DottedEventsWidget({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final Set<int> uniqueColors = events.map((e) => e.eventColor).toSet();

    return SizedBox(
      height: 4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) => ClipRRect(
          borderRadius: AppUtils.kBorderRadius64,
          child: ColoredBox(
            color: Color(Functions.getColor(uniqueColors.elementAt(index))),
            child: const SizedBox(
              height: 4,
              width: 4,
            ),
          ),
        ),
        separatorBuilder: (_, __) => AppUtils.kBoxWidth4,
        itemCount: uniqueColors.length,
      ),
    );
  }
}
