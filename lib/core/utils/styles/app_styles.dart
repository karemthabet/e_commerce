import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final TextStyle _baseStyle = GoogleFonts.poppins(
    color: AppColors.bluedark,
  );

  static final text20 = _baseStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static final text18 = _baseStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final text15 = _baseStyle.copyWith(fontSize: 15);

  static final text16 = _baseStyle.copyWith(fontSize: 16);
    static final ButtonStyle addToCartButton = ElevatedButton.styleFrom(
    foregroundColor: AppColors.whiteColor,
    textStyle: GoogleFonts.poppins(fontSize: 20),
    backgroundColor: AppColors.bluedark,
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
