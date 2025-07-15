import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart' show AppColors;
import 'package:e_commerce/core/utils/regx/app_regx.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:e_commerce/features/auth/data/models/login_request_model.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login_cubit/login_states.dart';
import 'package:e_commerce/features/auth/presentation/widgets/forgot_password_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController, passwordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: "Email",
            validator: (data) {
              if (data!.isEmpty) return "Email can't be empty";
              if (!AppRegex.isEmailValid(data)) return "Invalid email format";
              return null;
            },
          ),
          const SizedBox(height: 16),
          PasswordField(controller: passwordController, hintText: "Password"),
          const SizedBox(height: 20),
          const CustomText(text: "Forgot Password?"),
          const SizedBox(height: 20),
          BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              if (state is LoginFailure) {
                showSnackBarFuction(context, state.errMessage, isError: true);
              } else if (state is LoginSuccess) {
                showSnackBarFuction(
                  context,
                  "Login successfully",
                  isError: false,
                ).then((_) {
                  if (context.mounted) {
                    context.go(RoutesName.home);
                  }
                });
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blueAccentColor,
                  ),
                );
              }
              return GeneralButton(
                text: "Login",
                backgroundColor: AppColors.blueAccentColor,
                textColor: AppColors.whiteColor,
                onPressed: () => _handleLoginRequest(context),
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleLoginRequest(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final loginRequestModel = LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      );
      context.read<LoginCubit>().login(loginRequestModel: loginRequestModel);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
