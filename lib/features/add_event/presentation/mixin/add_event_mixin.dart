import 'package:flutter/cupertino.dart';
import 'package:todo/core/event/model/event_model.dart';

mixin AddEventMixin {
  late TextEditingController eventName;
  late TextEditingController eventDesc;
  late TextEditingController eventPlace;
  late TextEditingController eventTime;

  void initController() {
    eventName = TextEditingController();
    eventDesc = TextEditingController();
    eventPlace = TextEditingController();
    eventTime = TextEditingController();
  }

  void disposeController() {
    eventName.dispose();
    eventDesc.dispose();
    eventPlace.dispose();
    eventTime.dispose();
  }

  void setControllers(String time, Event? event){
    eventTime.text = time;
    eventName.text = event?.eventName ?? "";
    eventDesc.text = event?.eventDescription ?? "";
    eventPlace.text = event?.eventLocation ?? "";
  }

  void setTime(String time){
    eventTime.text = time;
  }
}
