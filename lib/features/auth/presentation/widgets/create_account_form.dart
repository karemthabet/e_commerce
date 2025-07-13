import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/regx/app_regx.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:e_commerce/features/auth/data/models/create_account_request_model.dart';
import 'package:e_commerce/features/auth/presentation/cubits/create_account_cubit/create_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubits/create_account_cubit/create_account_states.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  late TextEditingController emailController,
      passwordController,
      nameController,
      phoneController,
      confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
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
          CustomTextFormField(controller: nameController, hintText: "name"),
          CustomTextFormField(
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            validator: (data) {
              if (data!.isEmpty) {
                return "email can't be empty";
              }
              if (!AppRegex.isEmailValid(data)) {
                return "email is not valid";
              }
              return null;
            },
            hintText: "Email",
          ),
          CustomTextFormField(
            controller: phoneController,
            textInputType: TextInputType.phone,
            validator: (data) {
              if (data!.isEmpty) {
                return "phone number can't be empty";
              }
              if (!AppRegex.isPhoneNumberValid(data)) {
                return "phone number is not valid";
              }
              return null;
            },
            hintText: "phone number",
          ),
          PasswordField(controller: passwordController, hintText: "Password"),
          PasswordField(
            controller: confirmPasswordController,
            hintText: "Confirm Password",
          ),
          BlocConsumer<CreateAccountCubit, CreateAccountStates>(
            listener: (context, state) {
              if (state is CreateAccountFailure) {
                showSnackBarFuction(context, state.errMessage);
              }
              if (state is CreateAccountSuccess) {
                context.go(RoutesName.login);
              }
            },
            builder: (context, state) {
              if (state is CreateAccountLoading) {
                return const CircularProgressIndicator();
              }
              return GeneralButton(
                text: "Register",
                backgroundColor: Theme.of(context).primaryColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  _handleRegisterRequest(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _handleRegisterRequest(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        CreateAccountRequestModel createAccountRequestModel =
            CreateAccountRequestModel(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text,
              rePassword: confirmPasswordController.text,
              phone: phoneController.text,
            );
        context.read<CreateAccountCubit>().createAccount(
          createAccountRequestModel: createAccountRequestModel,
        );
      } else {
        showSnackBarFuction(context, "password doesn't match");
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
