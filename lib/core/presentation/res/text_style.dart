import 'package:expense_pro/core/presentation/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static final TextStyle titleLarge = GoogleFonts.inter(
    color: AppColor.dark75,
    // height: 80.0,
    fontSize: 64.0,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle title0 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.3,
    fontSize: 36.0,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle title1 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.2,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle title2 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.2,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle title3 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.2,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle regular1 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.2,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle regular2 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.2,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle regular3 = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.3,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle small = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.5,
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle tiny = GoogleFonts.inter(
    color: AppColor.dark75,
    height: 1.1,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
  );
}
