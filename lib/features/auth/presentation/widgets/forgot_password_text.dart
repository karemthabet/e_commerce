import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          context.go(RoutesName.forgotPassword);
        },
        child: Text(
          "forget Password?",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
