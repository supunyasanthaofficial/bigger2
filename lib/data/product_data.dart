import '../models/product_model.dart';
import '../services/database_service.dart';

class ProductData {
  static final DatabaseService _dbService = DatabaseService();

  static Future<List<Product>> getFlashSaleProducts() async {
    return await _dbService.getFlashSaleProducts();
  }

  static Future<List<Product>> getPopularProducts() async {
    return await _dbService.getPopularProducts();
  }

  static Future<List<Product>> getBeautyHealthProducts() async {
    return await _dbService.getProductsByCategory('Beauty & Health');
  }

  static Future<List<Product>> getClothingProducts() async {
    return await _dbService.getProductsByCategory('Clothing');
  }

  static Future<List<Product>> getSportsProducts() async {
    return await _dbService.getProductsByCategory('Sports');
  }

  static Future<List<Product>> getAccessoriesProducts() async {
    return await _dbService.getProductsByCategory('Accessories');
  }

  static Future<List<Product>> getFashionProducts() async {
    return await _dbService.getProductsByCategory('Fashion');
  }

  static Future<List<Product>> getProductsByCategory(String category) async {
    return await _dbService.getProductsByCategory(category);
  }

  static Future<List<Product>> getAllProducts() async {
    return await _dbService.getAllProducts();
  }
}
