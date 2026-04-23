import 'dart:ui';

abstract class AppColors {
  // Main Colors
  static const Color blue = Color(0xff02369C);
  static const Color lightBlue = Color(0xff5679BD);
  static const Color darkBlue = Color(0xff011234);
  static const Color black = Color(0xff0F0F0F);
  static const Color grey = Color(0xff535353);
  static const Color white = Color(0xffF9F9F9);
  static const Color green = Color(0xff11CE19);

  // Button Colors
  static const Color buttonActiveColor = Color(0xff02369C);
  static const Color buttonInactiveColor = Color(0xff878787);

  // Text Colors
  static const Color hintTextColor = Color(0xffA6A6A6);

  // Success and error
  static const Color success = Color(0xff11CE19);
  static const Color error = Color(0xffCC1010);
  
  static const Color red = Color(0xffCC1010); // Standardize on one red
  static const Color blackText = Color(0xff0F0F0F); // Standardize on one black (same as black?)
}
