import 'package:e_commerce/core/cashed/prefs.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/theme_cubit/theme_cubit.dart';
import 'package:e_commerce/e_commerce.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  setupServiceLocator();

  runApp(
    BlocProvider(
      create: (context) => ThemeCubit()..getCurrentTheme(),
      child: const ECommerceApp(),
    ),
  );
}
