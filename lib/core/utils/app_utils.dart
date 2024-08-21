import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  ///sliver sizebox
  static const kGap18 = SliverToBoxAdapter(child: kBoxHeight18);
  static const kGap20 = SliverToBoxAdapter(child: kBoxHeight20);
  static const kGap28 = SliverToBoxAdapter(child: kBoxHeight28);

  ///radius
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius10 = BorderRadius.all(Radius.circular(10));
  static const kBorderRadius64 = BorderRadius.all(Radius.circular(64));
  static const kBorderRadiusBottom10 = BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
  );
  static const kBorderRadiusBottom20 = BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );

  ///sized_box
  static const kBoxHeight2 = SizedBox(height: 2);
  static const kBoxHeight4 = SizedBox(height: 4);
  static const kBoxHeight6 = SizedBox(height: 6);
  static const kBoxHeight10 = SizedBox(height: 10);
  static const kBoxHeight12 = SizedBox(height: 12);
  static const kBoxHeight14 = SizedBox(height: 14);
  static const kBoxHeight16 = SizedBox(height: 16);
  static const kBoxHeight18 = SizedBox(height: 18);
  static const kBoxHeight20 = SizedBox(height: 20);
  static const kBoxHeight28 = SizedBox(height: 28);
  static const kBoxWidth4 = SizedBox(width: 4);
  static const kBoxWidth8 = SizedBox(width: 8);
  static const kBoxWidth10 = SizedBox(width: 10);
  static const kBoxWidth28 = SizedBox(width: 28);

  ///padding
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingHor28 = EdgeInsets.symmetric(horizontal: 28);
  static const kPaddingHor12 = EdgeInsets.symmetric(horizontal: 12);
  static const kPaddingHor16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingHor4 = EdgeInsets.symmetric(horizontal: 4);
  static const kPaddingHor7Ver3 = EdgeInsets.symmetric(horizontal: 7, vertical: 3);
  static const kPaddingVer16Hor14 = EdgeInsets.symmetric(horizontal: 14, vertical: 16);
  static const kPaddingVer18Hor28 = EdgeInsets.symmetric(horizontal: 28, vertical: 18);
  static const kPaddingHor8 = EdgeInsets.symmetric(horizontal: 8);
  static const kPaddingL16R16B16 = EdgeInsets.fromLTRB(16, 1, 16, 16);
  static const kPaddingL28R28B28 = EdgeInsets.fromLTRB(28, 1, 28, 28);
}
