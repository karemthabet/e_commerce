import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_cubit.dart';
import 'package:e_commerce/features/profile/presentation/widgets/edit_profile_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, required this.changeUserDataCubit});
  final ChangeUserDataCubit changeUserDataCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ChangeUserDataCubit>(),
      child: Scaffold(
        body: EditProfilePageBody(
          changeUserDataCubit: changeUserDataCubit,
        ),
      ),
    );
  }
}
