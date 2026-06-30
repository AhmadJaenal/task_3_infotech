import 'package:flutter/material.dart';

enum SnackbarType { success, error, info, warning }

class SnackbarConfig {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  const SnackbarConfig({
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
  });
}
