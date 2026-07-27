import '../models/category_model.dart';
import '../services/database_service.dart';

class CategoryData {
  static final DatabaseService _dbService = DatabaseService();

  static Future<List<Category>> getCategories() async {
    return await _dbService.getCategories();
  }
}
