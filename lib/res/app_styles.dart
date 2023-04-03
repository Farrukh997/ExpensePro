import 'package:expense_pro/res/app_colors.dart';
import 'package:expense_pro/res/app_text_style.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.light80,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: AppColors.light100,
          ),
          titleTextStyle: AppTextStyle.title3.copyWith(
            color: AppColors.light100,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.light100,
          ),
        ),
        textTheme: const TextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: AppColors.violet100,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: AppColors.violet100,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.violet100,
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
