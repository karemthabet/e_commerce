
import 'package:e_commerce/core/cashed/prefs.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme_cubit/theme_cubit.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({
    super.key,
  });

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      inactiveThumbColor: Colors.grey,
      activeColor: Theme.of(context).primaryColor,
      activeTrackColor: Colors.grey.shade700,
      // inactiveTrackColor: Colors.grey,
      value: Prefs.getBool(AppConstants.kIsDarkMode),
      onChanged: (value) {
        setState(
          () {
            Prefs.setBool(AppConstants.kIsDarkMode, value);
            BlocProvider.of<ThemeCubit>(context).getCurrentTheme();
          },
        );
      },
    );
  }
}
