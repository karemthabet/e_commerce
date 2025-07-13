

import 'package:e_commerce/features/onBording/data/model/on_bording_model.dart';
import 'package:flutter/material.dart';

class OnBoardingPageItem extends StatelessWidget {
  const OnBoardingPageItem({
    super.key,
    required this.onBoardingModel,
  });
  final OnBoardingModel onBoardingModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .2),
          Image.asset(
            height: 280,
            onBoardingModel.image,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            onBoardingModel.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            onBoardingModel.subtitle,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .25),
        ],
      ),
    );
  }
}