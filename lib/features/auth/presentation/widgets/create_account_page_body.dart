import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/auth/presentation/widgets/create_account_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountPageBody extends StatelessWidget {
  const CreateAccountPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 50),

            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Create Account",
                style: AppStyles.bodyStyle.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const CreateAccountForm(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
