import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:e_commerce/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/reset_password_cubit/reset_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/general_button.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        spacing: 16,
        children: [
          PasswordField(
            hintText: "new Password",
            controller: newPasswordController,
            textInputType: TextInputType.emailAddress,
          ),
          PasswordField(
            hintText: "Confirm Password",
            controller: confirmPasswordController,
            textInputType: TextInputType.emailAddress,
          ),
          BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
            listener: (context, state) {
              if (state is ResetPasswordFailure) {
                showSnackBarFuction(context, state.errMessage, isError: true);
              }
              if (state is ResetPasswordSuccess) {
                showSnackBarFuction(
                  context,
                  "reset password successfully",
                  isError: false,
                ).then((_) {
                  if (context.mounted) {
                    context.go(RoutesName.home);
                  }
                });
              }
            },
            builder: (context, state) {
              return GeneralButton(
                onPressed: () {
                  _hanldeVerfiyCode(context);
                },
                text: "Submit",
                backgroundColor: AppColors.blueAccentColor,
                textColor: AppColors.whiteColor,
              );
            },
          ),
        ],
      ),
    );
  }

  void _hanldeVerfiyCode(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (newPasswordController.text == confirmPasswordController.text) {
        context.read<ResetPasswordCubit>().resetPassword(
          newPassword: newPasswordController.text,
        );
      } else {
        showSnackBarFuction(context, "password doesn't match", isError: true);
      }
    }
  }
}
