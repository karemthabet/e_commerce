import 'package:e_commerce/core/functions/helper_size.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/widgets/custom_cursor.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/presentation/pages/widgets/colors_dot.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.product});
final Data product;
  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}
class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  Color? selectedColor;
  late final List<String> availableSizes;
  final List<Color> colors = [
    AppColors.pink,
    AppColors.black,
    AppColors.green,
    AppColors.blueColor,
    AppColors.purple,
  ];
  @override
  void initState() {
    selectedColor = colors.first;
    super.initState();
    availableSizes = ProductSizeHelper.getSizesForProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CustomCarouselSlider(
                        images: List<String>.from(widget.product.images!),
                        isNetwork: true,
                      )),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      child: Icon(Icons.favorite_border,
                          color: AppColors.greyColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.bluedark),
                    ),
                  ),
                  Text(
                    "EGP ${widget.product.price.toString()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.bluedark),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      " ${widget.product.sold} Sold",
                      style: const TextStyle(
                          fontSize: 18, color: AppColors.bluedark),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    "${widget.product.ratingsAverage} (${widget.product.ratingsQuantity.toString()})",
                    style: const TextStyle(
                        fontSize: 15, color: AppColors.bluedark),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.bluedark),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: const Row(
                      children: [
                        Icon(Icons.remove, size: 16),
                        SizedBox(width: 6),
                        Text("1"),
                        SizedBox(width: 6),
                        Icon(Icons.add, size: 16),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Description",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.bluedark),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.description!,
                style: const TextStyle(fontSize: 16, color: AppColors.bluedark),
              ),
              const SizedBox(height: 20),
              if (availableSizes.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Size",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.bluedark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      children: availableSizes
                          .map((size) => ChoiceChip(
                                label: Text(
                                  size,
                                  style: const TextStyle(
                                      color: AppColors.bluedark,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                selected: false,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              const SizedBox(height: 20),
              const Text(
                "Color",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.bluedark),
              ),
              const SizedBox(height: 8),
              Row(
                children: colors
                    .map((color) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: ColorDot(
                          color: color,
                          isSelected: selectedColor == color,
                        )))
                    .toList(),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total price",
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 4),
                      Text("EGP ${widget.product.price}",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.whiteColor,
                      textStyle: const TextStyle(fontSize: 25),
                      backgroundColor: AppColors.bluedark,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text("Add to cart"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
