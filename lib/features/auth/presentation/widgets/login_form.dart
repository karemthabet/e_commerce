
import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/regx/app_regx.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


import '../../data/models/login_request_model.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../cubits/login_cubit/login_states.dart';
import 'forgot_password_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController, passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  initState() {
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
        spacing: 16,
        children: [
          CustomTextFormField(
            controller: emailController,
            hitnText: "Email",
            validator: (data) {
              if (data!.isEmpty) {
                return "email can't be empty";
              }
              if (!AppRegex.isEmailValid(data)) {
                return "email is not valid";
              }
              return null;
            },
          ),
          PasswordField(
            controller: passwordController,
            hintText: "Password",
          ),
          const ForgotPasswordText(),
          BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              if (state is LoginFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is LoginSuccess) {
                showSnackBarFuction(context, "Login Success");
                context.go(RoutesName.home);
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              return GeneralButton(
                text: "Login",
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  _handleLoginRequest(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleLoginRequest(BuildContext context) {
    if (formKey.currentState!.validate()) {
      LoginRequestModel loginRequestModel = LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      );
      context.read<LoginCubit>().login(
        loginRequestModel: loginRequestModel,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
