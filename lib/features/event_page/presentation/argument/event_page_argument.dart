import 'package:todo/core/event/model/event_model.dart';

class EventPageArgument {
  final int? id;
  final bool? isFromHome;
  final Event? event;

  EventPageArgument({
    this.id,
    this.isFromHome,
    this.event,
  });
}
