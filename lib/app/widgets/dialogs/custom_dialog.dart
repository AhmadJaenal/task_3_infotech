import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';
import 'package:task_3_infotech/app/common/core/constant/app_text_style.dart';
import 'package:task_3_infotech/app/widgets/buttons/primary_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Ya',
    this.cancelText = 'Batal',
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
  }) {
    return showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle.h3,
        overflow: TextOverflow.ellipsis,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.paragraphM,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
      backgroundColor: AppColors.white,
      actions: [
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                titleButton: 'Cancel',
                onPressed: () => Get.back(),
              ),
            ),
            const Gap(8),
            Expanded(
              child: PrimaryButton(
                titleButton: confirmText,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class InformationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;

  const InformationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Ya',
    this.cancelText = 'Batal',
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Ya',
    String cancelText = 'Batal',
  }) {
    return showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
        cancelText: cancelText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle.h3,
        overflow: TextOverflow.ellipsis,
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.paragraphM,
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
      ),
      backgroundColor: AppColors.white,
      actions: [
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                titleButton: 'Cancel',
                onPressed: () => Get.back(),
              ),
            ),
            const Gap(8),
            Expanded(
              child: PrimaryButton(
                titleButton: confirmText,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
