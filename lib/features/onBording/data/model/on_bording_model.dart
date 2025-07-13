import 'package:e_commerce/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String subtitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnBoardingModel> onBoardingModels = [
  OnBoardingModel(
    image: AppAssets.imagesOnbording1,
    title: 'Shop Smarter',
    subtitle:
        'Find what you love quickly with smart search and tailored offers.',
  ),
  OnBoardingModel(
    image: AppAssets.imagesOnbording2,
    title: 'Wide Variety',
    subtitle:
        'Explore thousands of products across every category you need.',
  ),
  OnBoardingModel(
    image: AppAssets.imagesOnbording3,
    title: 'Fast & Easy Delivery',
    subtitle:
        'Track your orders live and enjoy super-fast doorstep delivery.',
  ),
];
