import 'package:e_commerce/core/utils/styles/app_styles.dart' show AppStyles;
import 'package:e_commerce/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:e_commerce/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        reverse: true,
        physics:const BouncingScrollPhysics(), 
        child: Column(
          children: [
            const SizedBox(height: 80),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login",
                style: AppStyles.bodyStyle.copyWith(
                  fontSize: 34,
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
                    'Welcome back! 👋',
                    style: AppStyles.bodyStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Please login to your account',
                    style: AppStyles.subTitleStyle.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const LoginForm(),
            const SizedBox(height: 24),
            const CustomRichText(
              normalText: 'Don\'t have an account?',
              highlightedTextWithonTap: 'Sign Up',
            ),
          ],
        ),
      ),
    );
  }
}