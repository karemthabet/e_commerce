import 'package:e_commerce/core/utils/assets/app_assets.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:flutter/material.dart';

class EditProfilePageBody extends StatefulWidget {
  const EditProfilePageBody({super.key});

  @override
  State<EditProfilePageBody> createState() => _EditProfilePageBodyState();
}

class _EditProfilePageBodyState extends State<EditProfilePageBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController emailController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 70),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(' Edit Profile',
                      style: AppStyles.text20
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 25)),
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage(AppAssets.editProfile),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: " update your name",
                    controller: nameController,
                    textInputType: TextInputType.name,
                  ),
                  CustomTextFormField(
                    hintText: " update your email",
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const GeneralButton(
                    text: "Update",
                    textColor: AppColors.whiteColor,
                    backgroundColor: AppColors.blueAccentColor,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
