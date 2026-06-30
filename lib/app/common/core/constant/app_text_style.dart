import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle title = GoogleFonts.manrope().copyWith(
    fontSize: 36.sp,
    fontWeight: AppWeightFont.extraBold,
  );

  static TextStyle h1 = GoogleFonts.manrope().copyWith(
    fontSize: 28.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h2 = GoogleFonts.manrope().copyWith(
    fontSize: 24.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle h3 = GoogleFonts.manrope().copyWith(
    fontSize: 20.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle paragraphL = GoogleFonts.manrope().copyWith(
    fontSize: 16.sp,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle paragraphM = GoogleFonts.manrope().copyWith(
    fontSize: 14.sp,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle paragraphS = GoogleFonts.manrope().copyWith(
    fontSize: 12.sp,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle paragraphXS = GoogleFonts.manrope().copyWith(
    fontSize: 10.sp,
    fontWeight: AppWeightFont.reguler,
  );

  static TextStyle paragraphLBold = GoogleFonts.manrope().copyWith(
    fontSize: 16.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle paragraphMBold = GoogleFonts.manrope().copyWith(
    fontSize: 14.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle paragraphSBold = GoogleFonts.manrope().copyWith(
    fontSize: 12.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle paragraphXSBold = GoogleFonts.manrope().copyWith(
    fontSize: 10.sp,
    fontWeight: AppWeightFont.bold,
  );

  static TextStyle paragraphSecondaryS = GoogleFonts.lexend().copyWith(
    fontSize: 14.sp,
    fontWeight: AppWeightFont.light,
  );
}

class AppWeightFont {
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight bold = FontWeight.w700;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight medium = FontWeight.w500;
  static FontWeight reguler = FontWeight.w400;
  static FontWeight light = FontWeight.w300;
}
