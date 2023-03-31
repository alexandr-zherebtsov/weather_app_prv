import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app_prv/shared/styles/colors.dart';
import 'package:weather_app_prv/shared/styles/styles.dart';

class AppThemes {
  static ThemeData getTheme() => window.platformBrightness == Brightness.dark ? dark : light;

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.green,
    primarySwatch: AppColors.green,
    brightness: AppColors.brightnessLight,
    cardColor: AppColors.lightGray_1,
    dividerColor: AppColors.lightGray_2,
    scaffoldBackgroundColor: AppColors.white,
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 4,
      shadowColor: AppColors.black,
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
      textStyle:  TextStyle(
        color: AppColors.black,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.black,
        fontSize: AppStyles.kCommonXXXXXLarge,
        fontWeight: AppStyles.kBold,
      ),
      headline2: TextStyle(
        color: AppColors.black,
        fontSize: AppStyles.kCommonXXXXLarge,
        fontWeight: AppStyles.kNormal,
      ),
      headline3: TextStyle(
        color: AppColors.black,
        fontSize: AppStyles.kCommonXXLarge,
        fontWeight: AppStyles.kNormal,
      ),
      headline4: TextStyle(
        color: AppColors.black,
        fontSize: AppStyles.kCommonLarge,
        fontWeight: AppStyles.kMedium,
      ),
      bodyText1: TextStyle(
        color: AppColors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      color: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: AppStyles.kCommonXXLarge,
      ),
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
  );
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.green,
    primarySwatch: AppColors.green,
    brightness: AppColors.brightnessDark,
    cardColor: AppColors.lightBlack,
    dividerColor: AppColors.lightBlack,
    scaffoldBackgroundColor: AppColors.mediumBlack,
    popupMenuTheme: const PopupMenuThemeData(
      elevation: 4,
      shadowColor: AppColors.black,
      color: AppColors.lightBlack,
      surfaceTintColor: AppColors.lightBlack,
      textStyle:  TextStyle(
        color: AppColors.white,
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.white,
        fontSize: AppStyles.kCommonXXXXXLarge,
        fontWeight: AppStyles.kBold,
      ),
      headline2: TextStyle(
        color: AppColors.white,
        fontSize: AppStyles.kCommonXXXXLarge,
        fontWeight: AppStyles.kNormal,
      ),
      headline3: TextStyle(
        color: AppColors.white,
        fontSize: AppStyles.kCommonXXLarge,
        fontWeight: AppStyles.kNormal,
      ),
      headline4: TextStyle(
        color: AppColors.white,
        fontSize: AppStyles.kCommonLarge,
        fontWeight: AppStyles.kMedium,
      ),
      bodyText1: TextStyle(
        color: AppColors.white,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      color: AppColors.mediumBlack,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: AppStyles.kCommonXXLarge,
      ),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
  );
}
