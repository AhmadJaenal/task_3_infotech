import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';

class AppTextStyle {
  static TextStyle title = GoogleFonts.inter().copyWith(
    fontSize: 36,
    fontWeight: AppWeightFont.extraBold,
    color: AppColors.black100,
  );
  static TextStyle h1 = GoogleFonts.inter().copyWith(
    fontSize: 28,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle h2 = GoogleFonts.inter().copyWith(
    fontSize: 24,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle h3 = GoogleFonts.inter().copyWith(
    fontSize: 20,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle paragraphL = GoogleFonts.inter().copyWith(
    fontSize: 16,
    fontWeight: AppWeightFont.reguler,
    color: AppColors.black100,
  );
  static TextStyle paragraphM = GoogleFonts.inter().copyWith(
    fontSize: 14,
    fontWeight: AppWeightFont.reguler,
    color: AppColors.black100,
  );
  static TextStyle paragraphS = GoogleFonts.inter().copyWith(
    fontSize: 12,
    fontWeight: AppWeightFont.reguler,
    color: AppColors.black100,
  );
  static TextStyle paragraphXS = GoogleFonts.inter().copyWith(
    fontSize: 10,
    fontWeight: AppWeightFont.reguler,
    color: AppColors.black100,
  );
  static TextStyle paragraphLBold = GoogleFonts.inter().copyWith(
    fontSize: 16,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle paragraphMBold = GoogleFonts.inter().copyWith(
    fontSize: 14,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle paragraphSBold = GoogleFonts.inter().copyWith(
    fontSize: 12,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle paragraphXSBold = GoogleFonts.inter().copyWith(
    fontSize: 10,
    fontWeight: AppWeightFont.bold,
    color: AppColors.black100,
  );
  static TextStyle paragraphSecondaryS = GoogleFonts.lexend().copyWith(
    fontSize: 14,
    fontWeight: AppWeightFont.light,
    color: AppColors.black100,
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
