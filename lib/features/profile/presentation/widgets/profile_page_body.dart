import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/utils/assets/app_assets.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_cubit.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_state.dart';
import 'package:e_commerce/features/profile/presentation/widgets/build_profile_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(' Profile',
                style: AppStyles.text20
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 30)),
            const SizedBox(height: 15),
            const CircleAvatar(
              radius: 70,
              backgroundImage:
                  AssetImage(AppAssets.profile), // غيّرها حسب صورتك
            ),
            const SizedBox(height: 20),
            BlocBuilder<ChangeUserDataCubit, ChangeUserDataState>(
              builder: (context, state) {
                String userName = Prefs.getString(AppConstants.kUserName)!;
                String email = Prefs.getString(AppConstants.kForgottenEmail)!;

                return Column(
                  children: [
                    Text(
                      userName,
                      style: AppStyles.text20
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      email,
                      style: AppStyles.text15,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 5),
            const SizedBox(height: 30),
            BuildProfileOptions(
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                context.push(
                  RoutesName.editProfile,
                  extra: context.read<ChangeUserDataCubit>(),
                );
              },
            ),
            BuildProfileOptions(
              icon: Icons.shopping_bag,
              title: 'My Orders',
              onTap: () {},
            ),
            BuildProfileOptions(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                context.push(RoutesName.changePassword);
              },
            ),
            BuildProfileOptions(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Prefs.removeData(key: AppConstants.kToken);
                context.go(RoutesName.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
