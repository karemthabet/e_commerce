import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRichText extends StatefulWidget {
  const CustomRichText({
    super.key,
    required this.normalText,
    required this.highlightedTextWithonTap,
  });

  final String normalText;
  final String highlightedTextWithonTap;

  @override
  State<CustomRichText> createState() => _CustomRichTextState();
}

class _CustomRichTextState extends State<CustomRichText> {
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer =
        TapGestureRecognizer()
          ..onTap = () {
            (widget.highlightedTextWithonTap == "Sign Up")
                ? context.push(RoutesName.createAnAccount)
                : context.pop();
          };
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.normalText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          TextSpan(
            recognizer: _tapRecognizer,
            text: widget.highlightedTextWithonTap,
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
