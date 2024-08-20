import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  ///sliver sizebox
  static const kGap20 = SliverToBoxAdapter(child: kBoxHeight20);


  ///radius
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius64 = BorderRadius.all(Radius.circular(64));

  ///sized_box
  static const kBoxHeight2 = SizedBox(height: 2);
  static const kBoxHeight20 = SizedBox(height: 20);
  static const kBoxWidth4 = SizedBox(width: 4);

  ///padding
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingHor28 = EdgeInsets.symmetric(horizontal: 28);
  static const kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const kPaddingHor7Ver3 = EdgeInsets.symmetric(horizontal: 7, vertical: 3);
  static const kPaddingVer16Hor14 = EdgeInsets.symmetric(horizontal: 14, vertical: 16);
  static const kPaddingHor8 = EdgeInsets.symmetric(horizontal: 8);

}
