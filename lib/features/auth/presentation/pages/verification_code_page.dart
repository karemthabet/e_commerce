import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/verficy_code_cubit/verify_code_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/verification_code_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => VerifyCodeCubit(getIt<AuthRepo>())),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(getIt<AuthRepo>()),
        ),
      ],
      child: const Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: VerificationCodePageBody(),
      ),
    );
  }
}
