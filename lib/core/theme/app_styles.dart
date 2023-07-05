import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:expense_pro/utils/res/app_text_style.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.light100,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.light100,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: AppColors.dark100,
          ),
          titleTextStyle: AppTextStyle.titleSmallBold.copyWith(
            color: AppColors.dark100,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.dark100,
          ),
        ),
        textTheme: const TextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: AppColors.violet100,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: AppColors.violet100,
              width: 1.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: AppColors.light60,
              width: 1.0,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.violet100,
          iconSize: 24.0,
        ),
        buttonTheme: ButtonThemeData(
          minWidth: double.infinity,
          splashColor: AppColors.violet100,
          buttonColor: AppColors.violet100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        primaryColor: AppColors.violet100,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: AppColors.light100,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.light100,
          selectedItemColor: AppColors.violet100,
        ),
      );
}
