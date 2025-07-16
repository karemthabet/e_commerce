import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/auth/presentation/widgets/verification_code_form.dart';
import 'package:flutter/material.dart';

class VerificationCodePageBody extends StatelessWidget {
  const VerificationCodePageBody({super.key});

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
                "Verification ",
                style: AppStyles.bodyStyle.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please enter the verification code sent to your email address. ',
                    textAlign: TextAlign.center,
                    style: AppStyles.subTitleStyle.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            const SizedBox(height: 18),
            const VerificationCodeForm(),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
