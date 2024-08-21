import 'package:todo/core/event/model/event_model.dart';

class AddEventArgument {
  final String? date;
  final Event? event;
  final bool? isEditEvent;

  AddEventArgument({
    this.date,
    this.event,
    this.isEditEvent = false,
  });
}
