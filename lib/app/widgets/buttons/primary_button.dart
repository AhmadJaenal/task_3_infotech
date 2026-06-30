import 'package:flutter/material.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';
import 'package:task_3_infotech/app/common/core/constant/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final String titleButton;
  final VoidCallback onPressed;
  final bool isLoading;
  final double width;
  final double height;
  final bool isDisable;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color shadowColor;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.titleButton,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 40,
    this.isDisable = false,
    this.backgroundColor = AppColors.primary1,
    this.foregroundColor = AppColors.white,
    this.disabledBackgroundColor = AppColors.black60,
    this.shadowColor = AppColors.primary1,
    this.borderRadius = 8,
  });

  bool get _disable => isLoading || isDisable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: (isLoading || isDisable) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          enableFeedback: _disable ? false : true,
          backgroundColor: _disable
              ? disabledBackgroundColor
              : (isLoading ? backgroundColor.withAlpha(50) : backgroundColor),
          foregroundColor: foregroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          shadowColor: shadowColor.withAlpha(50),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, anim) =>
              FadeTransition(opacity: anim, child: child),
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loader'),
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  titleButton,
                  key: const ValueKey('text'),
                  style: AppTextStyle.paragraphMBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
