import 'package:flutter/cupertino.dart';

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

  void setControllers(String time){
    eventTime.text = time;
  }
}
