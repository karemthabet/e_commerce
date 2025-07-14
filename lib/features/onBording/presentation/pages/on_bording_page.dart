import 'package:e_commerce/features/onBording/presentation/widgets/on_bording_page_body.dart';
import 'package:flutter/material.dart';

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingPageBody(
      ),
    );
  }
}