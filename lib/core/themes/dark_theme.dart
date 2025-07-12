import 'package:e_commerce/core/themes/shared_theme.dart';
import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  colorScheme: const ColorScheme.dark(primary: AppColors.primaryColor),
  brightness: Brightness.dark,
  useMaterial3: true,
  inputDecorationTheme: SharedTheme.inputDecorationTheme,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.grey,
    ),
  ),
  textTheme: SharedTheme.textTheme,
);
