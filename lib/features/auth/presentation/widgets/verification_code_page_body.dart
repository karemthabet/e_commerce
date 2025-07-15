import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/features/auth/presentation/widgets/custom_rich_text.dart';
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

            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 32),
            const CustomRichText(
              normalText: "if you didn't receive a code! ",
              highlightedTextWithonTap: "Resend",
            ),
            const SizedBox(height: 32),
             GeneralButton(
                text: "Verify",
                backgroundColor: AppColors.blueAccentColor,
                textColor: AppColors.whiteColor,
                onPressed: (){},
              )
          ],
        ),
      ),
    );
  }
}
