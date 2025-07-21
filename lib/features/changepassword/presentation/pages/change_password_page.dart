import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/changepassword/presentation/cubit/changepassword_cubit.dart';
import 'package:e_commerce/features/changepassword/presentation/widgets/change_password_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ChangePasswordCubit>(),
      child: const Scaffold(body: ChangePasswordPageBody()),
    );
  }
}
