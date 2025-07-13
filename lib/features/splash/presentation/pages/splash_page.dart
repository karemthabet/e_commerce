import 'package:e_commerce/features/splash/presentation/widgets/splash_page_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, 

      body: SplashPageBody(),
    );
  }
}
