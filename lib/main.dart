import 'package:e_commerce/core/functions/hide_status_bar.dart';
import 'package:e_commerce/core/functions/init_hive.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/services/simple_bloc_observer.dart';
import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/cache/prefs.dart';

import 'package:e_commerce/e_commerce.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Debug observer for BLoC
  Bloc.observer = SimpleBlocObserver();

  // Initialize local storage
  await initHive();

  // Initialize shared preferences
  await Prefs.init();

  // Setup service locator
  setupServiceLocator();

  // Hide status bar (optional)
  hideStatusBar();

  // Start app
  runApp(const ECommerceApp());
}



