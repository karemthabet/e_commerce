import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/features/auth/presentation/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/repos/auth_repo.dart';
import '../widgets/create_account_form.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
          
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.goNamed( RoutesName.login),
          ),
          title: const Text("Create Account"),
          centerTitle: true,
        ),


        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            reverse: true,
            physics: BouncingScrollPhysics(),
            child: Column(
              // spacing: 16,
              children: [
                SizedBox(height: 30),
                CreateAccountForm(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
