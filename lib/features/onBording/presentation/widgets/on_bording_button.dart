import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    required this.controller,
    required this.isLastPage,
  });

  final PageController controller;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.05,
      right: 10,
      left: 10,
      child: GeneralButton(
        onPressed: () async {
          if (isLastPage) {
            await Prefs.setSeenOnBoarding(true);
            if (context.mounted) {
              context.go(RoutesName.login);
            }
          } else {
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          }
        },

        text: isLastPage ? "Get Started" : 'Next',
        backgroundColor: AppColors.blueAccentColor,
        textColor: AppColors.whiteColor,
      ),
    );
  }
}
