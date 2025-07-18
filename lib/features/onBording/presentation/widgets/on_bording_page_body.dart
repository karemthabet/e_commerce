import 'package:e_commerce/features/onBording/data/model/on_bording_model.dart';
import 'package:e_commerce/features/onBording/presentation/widgets/dots_indecator.dart';
import 'package:e_commerce/features/onBording/presentation/widgets/on_bording_button.dart';
import 'package:e_commerce/features/onBording/presentation/widgets/on_bording_page_view.dart';
import 'package:e_commerce/features/onBording/presentation/widgets/skip_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingPageBody extends StatefulWidget {
  const OnBoardingPageBody({super.key});

  @override
  State<OnBoardingPageBody> createState() => _OnBoardingPageBodyState();
}

class _OnBoardingPageBodyState extends State<OnBoardingPageBody> {
  late PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController()
      ..addListener(() {
        setState(() {
          currentPage = controller.page?.round() ?? 0;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnBoardingPageView(controller: controller),
        Positioned.fill(
          top: MediaQuery.of(context).size.height * .70,
          child: Align(
            alignment: Alignment.center,
            child: DotsIndicators(controller: controller),
          ),
        ),
        OnBoardingButton(
          controller: controller,
          isLastPage: currentPage == onBoardingModels.length - 1,
        ),
        SkipWidget(isLastPage: currentPage == onBoardingModels.length - 1),
      ],
    );
  }
}
