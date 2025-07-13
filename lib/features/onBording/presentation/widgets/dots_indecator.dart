
import 'package:e_commerce/features/onBording/data/model/on_bording_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicators extends StatelessWidget {
  const DotsIndicators({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: onBoardingModels.length,
      axisDirection: Axis.horizontal,
      effect: ExpandingDotsEffect(
        spacing: 8.0,
        radius: 60,
        dotWidth: 10,
        dotHeight: 10.0,
        dotColor: Colors.grey.shade300,
        activeDotColor: Theme.of(context).primaryColor,
      ),
    );
  }
}