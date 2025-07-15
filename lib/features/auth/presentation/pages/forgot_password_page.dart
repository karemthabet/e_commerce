import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/setup_service_locator.dart';
import '../../data/repos/auth_repo.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(getIt<AuthRepo>()),
      child:  const Scaffold(
       
        backgroundColor: AppColors.whiteColor,

        body:ForgotPasswordBody() ),
      );
    
  }
}
