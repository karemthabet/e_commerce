import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/features/auth/presentation/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:e_commerce/features/auth/presentation/widgets/create_account_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        backgroundColor: AppColors.whiteColor,

        body: CreateAccountPageBody(),
      ),
    );
  }
}
