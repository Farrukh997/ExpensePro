import 'package:expense_pro/utils/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static final TextStyle headlineLarge = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 84.spMin,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle headlineMedium = GoogleFonts.inter(
    color: AppColors.dark75,
    height: 1.3,
    fontSize: 72.spMin,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle headlineSmall = GoogleFonts.inter(
    color: AppColors.dark75,
    height: 1.2,
    fontSize: 64.spMin,
  );
  static final TextStyle titleLarge = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 32.spMax,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle titleMedium = GoogleFonts.inter(
    color: AppColors.dark75,
    height: 1.2,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle titleSmallBold = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle titleSmall = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle bodyLarge = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 16.spMax,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle bodyLargeBold = GoogleFonts.inter(
    color: AppColors.dark75,
    height: 1.2,
    fontSize: 16.spMax,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14.spMax,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle bodySmall = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelLarge = GoogleFonts.inter(
    color: AppColors.dark75,
    height: 1.5,
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle labelMedium = GoogleFonts.inter(
    color: AppColors.dark75,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
}
