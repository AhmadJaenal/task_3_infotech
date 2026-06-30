import 'package:flutter/material.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';
import 'package:task_3_infotech/app/widgets/snackbar/snackbar_config.dart';

final Map<SnackbarType, SnackbarConfig> snackbarConfig = {
  SnackbarType.success: SnackbarConfig(
    backgroundColor: AppColors.success3,
    iconColor: AppColors.success1,
    icon: Icons.check_circle,
  ),
  SnackbarType.error: SnackbarConfig(
    backgroundColor: AppColors.error3,
    iconColor: AppColors.error1,
    icon: Icons.error,
  ),
  SnackbarType.info: SnackbarConfig(
    backgroundColor: AppColors.highlight5,
    iconColor: AppColors.highlight1,
    icon: Icons.info,
  ),
  SnackbarType.warning: SnackbarConfig(
    backgroundColor: AppColors.warning3,
    iconColor: AppColors.warning1,
    icon: Icons.warning_rounded,
  ),
};
