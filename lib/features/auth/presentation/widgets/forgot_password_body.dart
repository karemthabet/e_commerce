import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/auth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 50),
            
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Forgot Password",
                style: AppStyles.bodyStyle.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'please enter your email address to receive a link to reset your password.',
                    textAlign: TextAlign.center,
                    style: AppStyles.subTitleStyle.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const ForgotPasswordForm(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
