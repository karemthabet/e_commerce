import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/verficy_code_cubit/verify_code_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/verficy_code_cubit/verify_code_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeForm extends StatelessWidget {
  const VerificationCodeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<VerifyCodeCubit, VerifyCodeStates>(
          listener: (context, state) {
            if (state is VerifyCodeSuccess) {
              showSnackBarFuction(
                context,
                "verify code successfully",
                isError: false,
              ).then((_) {
                if (context.mounted) {
                  context.go(RoutesName.resetPassword);
                }
              });
            }
            if (state is VerifyCodeFailure) {
              showSnackBarFuction(context, state.errMessage, isError: true);
            }
          },
          builder: (context, state) {
            return PinCodeTextField(
              appContext: context,
              autoFocus: true,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              animationType: AnimationType.scale,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                borderWidth: 1,
                activeColor: Colors.blue,
                inactiveColor: Colors.blue,
                inactiveFillColor: Colors.white,
                activeFillColor: Colors.lightBlue,
                selectedColor: Colors.blue,
                selectedFillColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              onCompleted: (submittedCode) {
                context.read<VerifyCodeCubit>().verfiyCode(code: submittedCode);
              },
            );
          },
        ),
        const SizedBox(height: 24),

        BlocBuilder<VerifyCodeCubit, VerifyCodeStates>(
          builder: (context, state) {
            if (state is VerifyCodeLoading) {
              return const CircularProgressIndicator(
                color: AppColors.blueAccentColor,
              );
            }
            return GeneralButton(
              onPressed: () {
                context.read<ForgotPasswordCubit>().forgotPassword(
                  email: Prefs.getString(AppConstants.kForgottenEmail)!,
                );
                showSnackBarFuction(
                  context,
                  "Check your email",
                  isError: false,
                );
              },
              text: 'Resend Code',
              backgroundColor: Colors.blue,
              textColor: AppColors.whiteColor,
            );
          },
        ),
      ],
    );
  }
}
