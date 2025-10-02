import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../categories/accessories_screen.dart';
import '../categories/beauty_health_screen.dart';

import '../../models/product_model.dart';

import '../categories/clothing_screen.dart';
import '../categories/fashion_screen.dart';
import '../categories/featured_screen.dart';
import '../categories/sports_screen.dart';

void navigateToCategoryScreen(
  BuildContext context,
  Category category, {
  Function(Product)? onAddToCart,
}) {
  switch (category.name) {
    case 'Featured':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeaturedScreen(onAddToCart: onAddToCart),
        ),
      );
      break;
    case 'Beauty & Health':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BeautyHealthScreen(onAddToCart: onAddToCart),
        ),
      );
      break;
    case 'Clothing':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClothingScreen(onAddToCart: onAddToCart),
        ),
      );
      break;
    case 'Sports':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SportsScreen(onAddToCart: onAddToCart),
        ),
      );
      break;
    case 'Accessories':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccessoriesScreen(onAddToCart: onAddToCart),
        ),
      );
      break;
    case 'Fashion':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FashionScreen(onAddToCart: onAddToCart),
        ),
      );
      break;
    default:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FeaturedScreen(onAddToCart: onAddToCart),
        ),
      );
  }
}
