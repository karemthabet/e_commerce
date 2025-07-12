import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';
import 'shared_theme.dart';

ThemeData lightTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  scaffoldBackgroundColor: const Color(0xFFF1F1F1),
  colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
  brightness: Brightness.light,

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
