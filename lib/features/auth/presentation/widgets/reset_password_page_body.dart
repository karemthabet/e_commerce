import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/auth/presentation/widgets/reset_password_form.dart';
import 'package:flutter/material.dart';

class ResetPasswordPageBody extends StatelessWidget {
  const ResetPasswordPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "New Password",
                style: AppStyles.bodyStyle.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 60),
            const ResetPasswordForm(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
