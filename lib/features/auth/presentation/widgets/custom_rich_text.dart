import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.normalText,
    required this.highlightedTextWithonTap,
    required this.onTap,
  });
  final String normalText;
  final String highlightedTextWithonTap;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: normalText,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: highlightedTextWithonTap,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blueAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}
