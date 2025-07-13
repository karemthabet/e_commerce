import 'package:e_commerce/features/onBording/data/model/on_bording_model.dart';
import 'package:e_commerce/features/onBording/presentation/widgets/on_bording_page_view_item.dart';
import 'package:flutter/material.dart';



class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: onBoardingModels.length,
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return OnBoardingPageItem(
          onBoardingModel: onBoardingModels[index],
        );
      },
    );
  }
}