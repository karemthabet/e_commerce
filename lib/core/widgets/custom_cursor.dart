import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/widgets/general_network_image.dart';
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
            ? GeneralNetworkImage(imageUrl: image)
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
