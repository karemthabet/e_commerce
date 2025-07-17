import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.height = 50,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.00),
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
