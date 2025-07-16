import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/e_commerce.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  setupServiceLocator();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);//hide status bar

  runApp(const ECommerceApp());
}
