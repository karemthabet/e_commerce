import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/auth/presentation/widgets/verification_code_page_body.dart';
import 'package:flutter/material.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: VerificationCodePageBody(),
      
    );
  }
}