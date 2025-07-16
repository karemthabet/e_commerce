import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/reset_password_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        getIt<AuthRepo>(),
      ),
      child: const Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ResetPasswordPageBody(),
      ),
    );
  }
}
