import 'package:e_commerce/core/widgets/general_app_bar.dart';
import 'package:e_commerce/features/favourites/presentation/widgets/favorites_page_list_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.00,
              ),
              child: GeneralAppBar(
                pageTitle: "𝐹𝒶𝓋ℴ𝓇𝒾𝓉ℯ",
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: FavoritesPageListView(),
          ),
        ],
      ),
    );
  }
}
