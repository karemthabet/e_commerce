
import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/auth/presentation/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repo.dart';
import '../widgets/create_account_form.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(getIt<AuthRepo>()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                const CreateAccountForm(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
