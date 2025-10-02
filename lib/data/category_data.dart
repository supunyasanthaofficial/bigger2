import '../models/category_model.dart';

class CategoryData {
  static List<Category> getCategories() {
    return [
      Category(id: '1', name: 'Featured', icon: '⭐', itemCount: 4),
      Category(id: '2', name: 'Beauty & Health', icon: '💄', itemCount: 3),
      Category(id: '3', name: 'Clothing', icon: '👕', itemCount: 3),
      Category(id: '4', name: 'Sports', icon: '⚽', itemCount: 3),
      Category(id: '5', name: 'Accessories', icon: '🕶️', itemCount: 3),
      Category(id: '6', name: 'Fashion', icon: '👠', itemCount: 3),
    ];
  }
}
