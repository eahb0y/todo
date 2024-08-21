import 'package:flutter/cupertino.dart';

mixin HomeMixin {
  late PageController pageController;

  void initController(int currentPage) {
    pageController = PageController(initialPage: currentPage -1 );
  }

  void disposeController() {
    pageController.dispose();
  }
}
