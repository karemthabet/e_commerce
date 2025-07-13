import 'package:e_commerce/core/cashed/prefs.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/e_commerce.dart';
import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Prefs.init();
  setupServiceLocator();

  runApp(
    const ECommerceApp(),
  );
}
