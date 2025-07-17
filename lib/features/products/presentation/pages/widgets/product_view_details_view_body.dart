import 'package:e_commerce/core/functions/helper_size.dart';
import 'package:e_commerce/core/utils/colors/app_colors.dart';
import 'package:e_commerce/core/utils/styles/app_styles.dart';
import 'package:e_commerce/core/widgets/custom_cursor.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/presentation/pages/widgets/colors_dot.dart';
import 'package:e_commerce/core/widgets/custom_favorite.dart';
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
                  const CustomFavorite(),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.product.title!, style: AppStyles.text18),
                  ),
                  Text("EGP ${widget.product.price.toString()}",
                      style: AppStyles.text18),
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
                    child: Text(" ${widget.product.sold} Sold",
                        style: AppStyles.text18),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.star, color: AppColors.yellow, size: 18),
                  const SizedBox(width: 4),
                  Text(
                      "${widget.product.ratingsAverage} (${widget.product.ratingsQuantity.toString()})",
                      style: AppStyles.text15),
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
              Text(
                "Description",
                style: AppStyles.text20,
              ),
              const SizedBox(height: 8),
              Text(
                maxLines: 3,
                widget.product.description!,
                style: AppStyles.text16,
              ),
              const SizedBox(height: 20),
              if (availableSizes.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style: AppStyles.text20,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 10,
                      children: availableSizes
                          .map((size) => ChoiceChip(
                                label: Text(
                                  size,
                                  style: AppStyles.text20,
                                ),
                                selected: false,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              const SizedBox(height: 20),
              Text(
                "Color",
                style: AppStyles.text20,
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
                      Text("Total price",
                          style: AppStyles.text16
                              .copyWith(color: AppColors.greyColor)),
                      const SizedBox(height: 4),
                      Text(
                        "EGP ${widget.product.price}",
                        style: AppStyles.text16,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: AppStyles.addToCartButton,
                    child: const Text("Add to cart"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
