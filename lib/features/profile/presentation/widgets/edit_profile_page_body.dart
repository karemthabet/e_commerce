import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/functions/show_snack_bar_function.dart';
import 'package:e_commerce/core/utils/assets/app_assets.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_cubit.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePageBody extends StatefulWidget {
  const EditProfilePageBody({super.key, required this.changeUserDataCubit});
  final ChangeUserDataCubit changeUserDataCubit;

  @override
  State<EditProfilePageBody> createState() => _EditProfilePageBodyState();
}

class _EditProfilePageBodyState extends State<EditProfilePageBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    final name = Prefs.getString(AppConstants.kUserName);
    final email = Prefs.getString(AppConstants.kForgottenEmail);
    nameController = TextEditingController(text: name);
    emailController = TextEditingController(text: email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Edit Profile',
              style: AppStyles.text20.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage(AppAssets.editProfile),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              hintText: "Update your name",
              controller: nameController,
              textInputType: TextInputType.name,
            ),
            CustomTextFormField(
              hintText: "Update your email",
              controller: emailController,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            BlocConsumer<ChangeUserDataCubit, ChangeUserDataState>(
              bloc: widget.changeUserDataCubit,
              listener: (context, state) {
                if (state is ChangeUserDataError) {
                  showSnackBarFuction(context, state.errorMessage,
                      isError: true);
                } else if (state is ChangeUserDataSuccess) {
                  showSnackBarFuction(context, "Update successfully",
                      isError: false);
                }
              },
              builder: (context, state) {
                if (state is ChangeUserDataLoading) {
                  return const CircularProgressIndicator(
                    color: AppColors.blueAccentColor,
                  );
                }
                return GeneralButton(
                  onPressed: () => _handleUpdateUserDataRequest(context),
                  text: "Update",
                  textColor: AppColors.whiteColor,
                  backgroundColor: AppColors.blueAccentColor,
                );
              },
            )
          ],
        ),
      ),
    );
  }

void _handleUpdateUserDataRequest(BuildContext context) {
  if (formKey.currentState!.validate()) {
    final String currentName = Prefs.getString(AppConstants.kUserName)!;
    final String currentEmail = Prefs.getString(AppConstants.kForgottenEmail)!;

    final String newName = nameController.text.trim();
    final String newEmail = emailController.text.trim();

    final String? nameToUpdate = newName != currentName ? newName : null;
    final String? emailToUpdate = newEmail != currentEmail ? newEmail : null;
    

    if (nameToUpdate == null && emailToUpdate == null) {
      showSnackBarFuction(context, "No changes detected", isError: true);
      return;
    }
    widget.changeUserDataCubit.changeUserData(
      newName: nameToUpdate,
      newEmail: emailToUpdate,
    );
  } else {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }
}

}
