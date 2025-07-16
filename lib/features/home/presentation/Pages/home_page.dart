
import 'package:e_commerce/features/home/presentation/Pages/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/features/home/presentation/Pages/widgets/home_page_body.dart';
import 'package:e_commerce/features/products/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const HomePagesBody(),
const ProductPage(),
    const Center(child: Text("Favorites")),
    const Center(child: Text("Profile")),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:CustomBottomNavigationBar(onTap: onTap, currentIndex: currentIndex)
    );
  }
}
