import 'package:flutter/cupertino.dart';

mixin HomeMixin {
  late PageController pageController;

  void initController() {
    pageController = PageController();
  }

  void disposeController() {
    pageController.dispose();
  }
}
