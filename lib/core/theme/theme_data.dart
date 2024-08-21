import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_text_style.dart';
import 'package:todo/core/utils/app_utils.dart';

import 'colors/app_colors.dart';

final appTheme = ThemeData(
  fontFamily: "Montserrat",
  useMaterial3: true,
  applyElevationOverlayColor: true,
  disabledColor: ThemeColors.disabledColor,
  splashColor: ThemeColors.primaryColor.withOpacity(0.01),
  focusColor: ThemeColors.primaryColor,
  colorSchemeSeed: ThemeColors.primaryColor,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //       EdgeInsets.zero,
  //     ),
  //   ),
  // ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
  ),
);

final lightTheme = appTheme.copyWith(
  scaffoldBackgroundColor: ThemeColors.scaffoldColor,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: ThemeColors.primaryColor,
  ),
  listTileTheme: const ListTileThemeData(
    minVerticalPadding: 14,
    minLeadingWidth: 16,
    horizontalTitleGap: 12,
    tileColor: AppColors.textField,
    selectedColor: AppColors.textField,
    selectedTileColor: AppColors.textField,
    shape: RoundedRectangleBorder(
      borderRadius: AppUtils.kBorderRadius8,
    ),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 1,
      foregroundColor: ThemeColors.scaffoldColor,
      backgroundColor: ThemeColors.scaffoldColor,
      surfaceTintColor: ThemeColors.scaffoldColor,
      shadowColor: Colors.black,
      toolbarHeight: 56,
    iconTheme: IconThemeData(
      color: ThemeColors.iconColor,
    ),
    titleSpacing: 0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    alignLabelWithHint: true,
    contentPadding: AppUtils.kPaddingVer16Hor14,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: ThemeColors.errorColor),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: AppColors.textField),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: AppColors.textField),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(
        color: ThemeColors.primaryColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: AppColors.textField),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide(color: ThemeColors.errorColor),
    ),
    filled: true,
    isDense: true,
    prefixStyle: AppTextStyle.textField,
    fillColor: AppColors.textField,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    // floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return ThemeColors.primaryColor;
          }
          return null;
        },
      ),
      elevation: WidgetStateProperty.all<double>(0),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: ThemeColors.white,
        ),
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.white;
        } else {
          return AppColors.white;
        }
      }),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return ThemeColors.disabledColor;
        } else {
          return ThemeColors.primaryColor;
        }
      }),
      maximumSize: WidgetStateProperty.all<Size>(
        const Size(double.infinity, 56),
      ),
      minimumSize: WidgetStateProperty.all<Size>(
        const Size(double.infinity, 56),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    // surfaceTintColor: Colors.transparent,
    modalBackgroundColor: Colors.transparent,
    modalElevation: 0,
    elevation: 0,
  ),
);

