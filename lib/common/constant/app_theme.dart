import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/common/constant/app_colors.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    surface: Colors.grey[900]!,
    error: AppColors.error,
  ),
  scaffoldBackgroundColor: Colors.grey[900],
  iconTheme: const IconThemeData(color: AppColors.textSecondary),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: Colors.grey[900],
    elevation: 0,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.textSecondary,
    ),
    iconTheme: const IconThemeData(color: AppColors.textSecondary),
  ),
);
