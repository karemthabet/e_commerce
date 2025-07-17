import 'package:e_commerce/core/widgets/cart_icon.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CartIcon(),
      ),
    );
  }
}
