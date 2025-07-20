import 'package:e_commerce/core/widgets/general_app_bar.dart';
import 'package:flutter/material.dart';

class FavoritesPageAppBar extends StatelessWidget {
  const FavoritesPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.00,
              ),
              child: GeneralAppBar(
                pageTitle: "𝐹𝒶𝓋ℴ𝓇𝒾𝓉ℯ",
              ),
            );
  }
}