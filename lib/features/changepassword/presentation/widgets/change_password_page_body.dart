import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/assets/app_assets.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:e_commerce/features/changepassword/presentation/cubit/changepassword_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPageBody extends StatefulWidget {
  const ChangePasswordPageBody({super.key});

  @override
  State<ChangePasswordPageBody> createState() => _ChangePasswordPageBodyState();
}

class _ChangePasswordPageBodyState extends State<ChangePasswordPageBody> {
  late TextEditingController currentPassword;
  late TextEditingController newPassword;
  late TextEditingController rePassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    currentPassword = TextEditingController();
    newPassword = TextEditingController();
    rePassword = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    rePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(' Change Password',
                      style: AppStyles.text20
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(AppAssets.changePass),
                  ),
                  const SizedBox(height: 20),
                  PasswordField(
                      hintText: "Current Password",
                      controller: currentPassword,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "password can't be empty";
                        }
                        return null;
                      }),
                  PasswordField(
                      hintText: "New Password",
                      controller: newPassword,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "password can't be empty";
                        }
                        return null;
                      }),
                  PasswordField(
                      hintText: "Re-Password",
                      controller: rePassword,
                      validator: (data) {
                        if (data!.isEmpty) {
                          return "password can't be empty";
                        } else if (data != newPassword.text) {
                          return "password doesn't match";
                        }
                        return null;
                      }),
                  BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                    listener: (context, state) {
                      if (state is ChangepasswordError) {
                        showSnackBarFuction(context, state.error,
                            isError: true);
                      }
                      if (state is ChangepasswordSuccess) {
                        showSnackBarFuction(context, "Password changed",
                                isError: false)
                            .then((_) {
                          if (context.mounted) {
                            context.pop();
                          }
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is ChangepasswordLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blueAccentColor,
                          ),
                        );
                      }
                      return GeneralButton(
                        text: "Save",
                        backgroundColor: AppColors.blueAccentColor,
                        textColor: AppColors.whiteColor,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<ChangePasswordCubit>().changePassword(
                                  currentPassword: currentPassword.text,
                                  newPassword: newPassword.text,
                                );
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
