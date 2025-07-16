import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart'
    show AppConstants;
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateAfterDelay();
  }

  void initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  Future<void> navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final hasSeenOnBoarding = Prefs.getBool(AppConstants.seenOnBoarding);
    final token = Prefs.getString(AppConstants.kToken);

    if (!hasSeenOnBoarding) {
      context.go(RoutesName.onBoarding);
    } else if (token == null) {
      context.go(RoutesName.login);
    } else {
      context.go(RoutesName.home);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.splashGradientColor,
              AppColors.splashGradientColor2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(opacity: _fadeAnimation, child: child),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 80,
                  color: AppColors.blackColor,
                ),
                const SizedBox(height: 20),
                Text('Shoppie', style: AppStyles.bodyStyle),
                const SizedBox(height: 10),
                Text(
                  'Smart Shopping. Simple Living.',
                  style: AppStyles.subTitleStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
