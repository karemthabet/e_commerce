import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_cubit.dart';
import 'package:e_commerce/features/profile/presentation/widgets/profile_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ChangeUserDataCubit>(),
      child: const ProfilePageBody(),
    );
  }
}
