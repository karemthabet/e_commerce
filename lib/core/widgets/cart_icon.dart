import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          color: AppColors.bluedark,
          size: 40,
        ),
        onPressed: () {
          if (context.mounted) {
            context.go(RoutesName.login);
          }
        },
      ),
    );
  }
}
