import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
  splashFactory: NoSplash.splashFactory,
  colorScheme: const ColorScheme.dark(primary: AppColors.primaryColor),
  brightness: Brightness.dark,
  useMaterial3: true,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.grey,
    ),
  ),
);
