import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/widgets/cart_icon.dart';
import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget {
GeneralAppBar({super.key, @required this.pageTitle});
  String? pageTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$pageTitle",
          style: const TextStyle(fontSize: 50, color: AppColors.bluedark),
        ),
        const CartIcon(),
      ],
    );
  }
}
