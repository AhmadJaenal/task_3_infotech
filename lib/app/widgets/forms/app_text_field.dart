import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:task_3_infotech/app/common/core/constant/app_color.dart';
import 'package:task_3_infotech/app/common/core/constant/app_text_style.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? errorText;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isPassword;
  final bool isTextArea;
  final bool isEnable;
  final bool numberOnly;
  final bool readOnly;
  final bool withLabel;
  final bool isBorderRadius;
  final double borderRadius;
  final Color fillColor;
  final Color focusedBorderColor;
  final Color borderColor;
  final Color errorBorderColor;
  final Color errorTextColor;
  final Color textColor;

  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    required this.controller,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.isPassword = false,
    this.isTextArea = false,
    this.isEnable = true,
    this.numberOnly = false,
    this.readOnly = false,
    this.withLabel = false,
    this.isBorderRadius = true,
    this.borderRadius = 8.0,
    this.fillColor = Colors.white,
    this.focusedBorderColor = AppColors.blue,
    this.borderColor = AppColors.black20,
    this.errorBorderColor = AppColors.error1,
    this.errorTextColor = AppColors.error1,
    this.textColor = AppColors.black,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscure = false;
  String? _errorText;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.withLabel && widget.label != null) ...[
          Text(
            widget.label ?? '',
            style: AppTextStyle.paragraphM.copyWith(color: AppColors.black),
          ),
          const Gap(6),
        ],
        Container(
          height: widget.isTextArea ? 130 : null,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: widget.isBorderRadius
                ? BorderRadius.circular(widget.borderRadius)
                : BorderRadius.circular(0),
          ),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.numberOnly ? TextInputType.number : null,
            maxLines: widget.isTextArea ? null : 1,
            minLines: widget.isTextArea ? 5 : 1,
            enabled: widget.isEnable,
            readOnly: widget.readOnly,
            validator: widget.validator,
            obscureText: _isObscure,
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.bottom,
            style: AppTextStyle.paragraphMBold.copyWith(
              color: widget.textColor,
            ),
            decoration: InputDecoration(
              fillColor: widget.fillColor,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(widget.prefixIcon!, height: 14),
                    )
                  : SizedBox.shrink(),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : widget.suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(widget.suffixIcon!, height: 14),
                    )
                  : const SizedBox.shrink(),
              errorText: widget.errorText ?? _errorText,
              errorStyle: AppTextStyle.paragraphMBold.copyWith(
                color: widget.errorBorderColor,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: widget.borderColor, width: 1.5),
                borderRadius: widget.isBorderRadius
                    ? BorderRadius.circular(widget.borderRadius)
                    : BorderRadius.circular(0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.isBorderRadius
                    ? BorderRadius.circular(widget.borderRadius)
                    : BorderRadius.circular(0),
                borderSide: BorderSide(
                  color: widget.focusedBorderColor,
                  width: 1.5,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: AppTextStyle.paragraphM.copyWith(
                color: AppColors.black80,
              ),
            ),
            onChanged: (value) {
              final error = widget.validator?.call(widget.controller?.text);
              if (error == null) {
                setState(() {
                  _errorText = null;
                });
              }
            },
            focusNode: _focus,
          ),
        ),
      ],
    );
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      setState(() {
        _errorText = widget.validator?.call(widget.controller?.text);
      });
    }
  }
}
