import 'package:e_commerce/features/products/data/models/product_model.dart';

class ProductSizeHelper {
  static List<String> getSizesForProduct(Data product) {
    final title = product.title?.toString().toLowerCase() ?? '';
    final category = product.category?.name?.toString().toLowerCase() ?? '';
    if (title.contains('sweater') || title.contains('shirt') || title.contains('t-shirt') ||
        category.contains('shirt') || category.contains('t-shirt')) {
      return ['S', 'M', 'L', 'XL'];
    }
    else if (title.contains('pants') || title.contains('jeans') || title.contains('socks')||
        category.contains('pants') || category.contains('jeans')) {
      return ['S', 'M', 'L', 'XL'];
    }
    else if (title.contains('shoe') || title.contains('sneaker') ||
        category.contains('shoe') || category.contains('sneaker')) {
      return ['38', '39', '40', '41', '42'];
    }
    else if (title.contains('scarf') || title.contains('woman shawl') ||
        category.contains('scarf') || category.contains('woman shawl') ||
        title.contains('bag') || category.contains('bag') ||
        title.contains('playstation') || category.contains('playstation')) {
      return ['One Size'];
    }
    else {
      return [];
    }
  }
}
