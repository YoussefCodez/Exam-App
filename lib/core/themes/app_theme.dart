import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: AppColors.buttonActiveColor,
        foregroundColor: AppColors.white,
        textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight(500)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 20,fontWeight: FontWeight(500),color: AppColors.black), // Appbar title
      bodyMedium: TextStyle(fontSize: 16,fontWeight: FontWeight(400),color: AppColors.black),
    ),

    appBarTheme: AppBarTheme(elevation: 0.0,foregroundColor: AppColors.black),

    inputDecorationTheme: InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    floatingLabelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight(400),color: AppColors.grey),
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