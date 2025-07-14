import 'package:e_commerce/core/utils/styles/app_styles.dart';
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
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          SizedBox(
            height: size.height * 0.33,
            child: Image.asset(
              onBoardingModel.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            onBoardingModel.title,
            style: AppStyles.bodyStyle.copyWith(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            onBoardingModel.subtitle,
            style: AppStyles.subTitleStyle.copyWith(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
