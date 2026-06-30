import 'package:flutter/material.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';

extension AppThemeExtension on BuildContext {
  ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
    textTheme: const TextTheme().apply(
      bodyColor: AppColors.black100,
      displayColor: AppColors.black100,
    ),
  );
}
