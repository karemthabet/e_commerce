import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  final List<String> images;
  final bool isNetwork;

  const CustomCarouselSlider({
    super.key,
    required this.images,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((image) {
        return isNetwork
            ? CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.blueAccentColor,
                      ),
                    ),
                errorWidget: (context, url, error) {
                  return const Icon(
                    size: 140,
                    Icons.broken_image,
                    color: Colors.red,
                  );
                })
            : Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
    );
  }
}
