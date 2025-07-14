import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DontHaveAccount extends StatefulWidget {
  const DontHaveAccount({
    super.key,
    required this.normalText,
    required this.highlightedTextWithonTap,
  });

  final String normalText;
  final String highlightedTextWithonTap;

  @override
  State<DontHaveAccount> createState() => _DontHaveAccountState();
}

class _DontHaveAccountState extends State<DontHaveAccount> {
  late TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.goNamed(RoutesName.createAnAccount);
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
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.normalText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            recognizer: _tapRecognizer,
            text: widget.highlightedTextWithonTap,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
