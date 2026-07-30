import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import './accessories_screen.dart';
import './beauty_health_screen.dart';
import './clothing_screen.dart';
import './fashion_screen.dart';
import './featured_screen.dart';
import './sports_screen.dart';

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
