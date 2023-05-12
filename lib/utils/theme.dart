import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
      colorScheme: ColorScheme(
        primary: AppColors.primaryBlue, // for buttons and main theme
        secondary: AppColors.secondaryBlue, // for containers and sizedboxes
        background: AppColors.backgroundColor, // scaffold background color
        surface: AppColors.textfieldColor, // textfield color
        onPrimary: AppColors.whiteColor, // for texts
        onSecondary: AppColors.textColor, // textformfield hint color
        onBackground: AppColors.textColor, // texts description color
        onSurface: AppColors.textHintColor, // additional color
        error: Colors.red,
        onError: Colors.red, // optional: used for error messages
        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          // forgot pass, ottp verif.., create pass
            fontFamily: "Montserrat",
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor),
        headlineSmall: TextStyle(
          //username, email etc.
            fontFamily: "Montserrat",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor),
        titleLarge: TextStyle(
          //description under all texts,
            fontFamily: "Montserrat",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.descriptionColor),
        titleMedium: TextStyle(
          //hint text inside textfield
            fontFamily: "Montserrat",
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textHintColor),
        titleSmall: TextStyle(
          fontFamily:  "Montserrat",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
      ),);

}
