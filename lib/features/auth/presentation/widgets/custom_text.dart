import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          (text == "Forgot Password?")
              ? context.push(RoutesName.forgotPassword)
              : context.push(RoutesName.login);
        },
        child: Text(
          text,
          style: AppStyles.subTitleStyle.copyWith(
            color: AppColors.blackColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
