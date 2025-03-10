import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme({Color? accent}) {
    return ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: accent ?? primaryColor,
            primary: accent ?? primaryColor,
            onPrimary: backgroundColorLightAlt,
            secondary: secondaryColor,
            onSecondary: backgroundColorLightSecondary,
            tertiary: blackColor,
            onTertiary: blackColor,
            primaryContainer: primaryColor,
            onPrimaryContainer: whiteColor,
            error: Colors.red,
            onError: whiteColor,
            outline: accent ?? primaryColor),
        hintColor: blackColor.withValues(alpha: 0.2),
        scaffoldBackgroundColor: backgroundColorLight,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: backgroundColorLightAlt,
          iconTheme: IconThemeData(color: blackColor),
          titleTextStyle: TextStyle(
              color: blackColor, fontSize: 24.0, fontWeight: FontWeight.w700),
        ),
        cardTheme: CardTheme(
            margin: EdgeInsets.zero,
            color: whiteColor,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: whiteColor,
          showSelectedLabels: false,
          // unselectedItemColor: inactiveColor,
          selectedItemColor: secondaryColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
            dragHandleColor: blackColor.withValues(alpha: 0.5),
            dragHandleSize: const Size(100, 3),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            modalBackgroundColor: Colors.transparent),
        snackBarTheme: SnackBarThemeData(
            backgroundColor: accent ?? primaryColor,
            contentTextStyle: const TextStyle(
                color: whiteColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w700)),
        datePickerTheme: const DatePickerThemeData(
            headerHeadlineStyle: TextStyle(
                color: blackColor, fontSize: 22, fontWeight: FontWeight.w700),
            weekdayStyle: TextStyle(
                color: blackColor, fontSize: 14, fontWeight: FontWeight.w700),
            dayStyle: TextStyle(
                color: whiteColor, fontSize: 13, fontWeight: FontWeight.w700),
            inputDecorationTheme: InputDecorationTheme(),
            backgroundColor: whiteColor,
            surfaceTintColor: whiteColor),
        popupMenuTheme: const PopupMenuThemeData(
            color: whiteColor, surfaceTintColor: whiteColor),
        canvasColor: whiteColor,
        dividerColor: Colors.transparent,
        fontFamily: "Nunito",
        textTheme: AppTextTheme.lightTextTheme(),
    );
  }

  static ThemeData darkTheme({Color? accent}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: accent ?? primaryColor,
          primary: accent ?? primaryColor,
          onPrimary: backgroundColorDarkAlt,
          secondary: secondaryColor,
          onSecondary: backgroundColorDarkSecondary,
          tertiary: blackColor,
          onTertiary: whiteColor,
          primaryContainer: primaryColor,
          onPrimaryContainer: whiteColor,
          error: Colors.red,
          onError: whiteColor,
          outline: accent ?? primaryColor),
      hintColor: blackColor.withValues(alpha: 0.2),
      scaffoldBackgroundColor: backgroundColorDark,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: backgroundColorLightAlt,
        iconTheme: IconThemeData(color: blackColor),
        titleTextStyle: TextStyle(
            color: blackColor, fontSize: 24.0, fontWeight: FontWeight.w700),
      ),
      cardTheme: CardTheme(
          margin: EdgeInsets.zero,
          color: whiteColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: whiteColor,
        showSelectedLabels: false,
        // unselectedItemColor: inactiveColor,
        selectedItemColor: secondaryColor,
      ),
      bottomSheetTheme: BottomSheetThemeData(
          dragHandleColor: whiteColor.withValues(alpha: 0.5),
          dragHandleSize: const Size(50, 3),
          showDragHandle: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          modalBackgroundColor: Colors.transparent),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: accent ?? primaryColor,
          contentTextStyle: const TextStyle(
              color: whiteColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w700)),
      datePickerTheme: const DatePickerThemeData(
          headerHeadlineStyle: TextStyle(
              color: blackColor, fontSize: 22, fontWeight: FontWeight.w700),
          weekdayStyle: TextStyle(
              color: blackColor, fontSize: 14, fontWeight: FontWeight.w700),
          dayStyle: TextStyle(
              color: whiteColor, fontSize: 13, fontWeight: FontWeight.w700),
          inputDecorationTheme: InputDecorationTheme(),
          backgroundColor: whiteColor,
          surfaceTintColor: whiteColor),
      popupMenuTheme: const PopupMenuThemeData(
          color: whiteColor, surfaceTintColor: whiteColor),
      canvasColor: whiteColor,
      dividerColor: Colors.transparent,
      fontFamily: "Nunito",
      textTheme: AppTextTheme.darkTextTheme(),
    );
  }
}

class AppTextTheme {
  static TextTheme lightTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
          color: blackColor, fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: blackColor, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: blackColor, fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: blackColor, fontSize: 24, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: blackColor, fontSize: 22, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: blackColor, fontSize: 20, fontWeight: FontWeight.w700),
    );
  }

  static TextTheme darkTextTheme() {
    return const TextTheme(
      bodyLarge: TextStyle(
          color: whiteColor, fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: whiteColor, fontSize: 14, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          color: whiteColor, fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: whiteColor, fontSize: 24, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: whiteColor, fontSize: 22, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: whiteColor, fontSize: 20, fontWeight: FontWeight.w700),
    );
  }
}
