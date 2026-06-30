import 'package:flutter/material.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';
import 'package:task_3_infotech/app/common/core/constant/app_text_style.dart';
import 'snackbar_config.dart';
import 'snackbar_type.dart';

SnackBar customSnackbar(
  String title,
  String message, {
  SnackbarType type = SnackbarType.info,
}) {
  final config = snackbarConfig[type]!;

  return SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(vertical: 12),
    content: Container(
      width: double.infinity,
      height: 83,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(config.icon, color: config.iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$title\n',
                    style: AppTextStyle.paragraphMBold.copyWith(
                      color: AppColors.black100,
                    ),
                  ),
                  TextSpan(
                    text: message,
                    style: AppTextStyle.paragraphM.copyWith(
                      color: AppColors.black100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
