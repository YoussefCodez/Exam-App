import 'package:exam/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        padding: EdgeInsets.all(16.0),
        backgroundColor: AppColors.buttonActiveColor,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight(500)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight(500),
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight(500),
        color: AppColors.black,
      ), // // Appbar title
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight(400),
        color: AppColors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight(400),
        color: AppColors.black,
      ),
      headlineSmall: TextStyle(
        fontWeight: .w500,
        fontSize: 14.sp,
        color: AppColors.grey,
      ),
      headlineLarge: TextStyle(
        fontWeight: .w500,
        fontSize: 18.sp,
        color: AppColors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: .w400,
        color: AppColors.black
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight(400),
        color: AppColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.error),
      ),
      hintStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight(400),
        color: AppColors.hintTextColor,
      ),
      helperStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight(400),
        color: AppColors.error,
      ),
    ),
  );
}
