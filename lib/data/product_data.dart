import '../models/product_model.dart';

class ProductData {
  static List<Product> getFlashSaleProducts() {
    return [
      Product(
        id: '1',
        name: 'Inpods pro Air 13 pods',
        image:
            'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400&h=400&fit=crop',
        originalPrice: 20500.00,
        discountedPrice: 13000.00,
        rating: 4.5,
        isHot: true,
        category: 'Electronics',
        description: 'Wireless Bluetooth earbuds with premium sound quality',
      ),
      Product(
        id: '2',
        name: 'Smart Watch Series 5',
        image:
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=400&fit=crop',
        originalPrice: 25000.00,
        discountedPrice: 18900.00,
        rating: 4.3,
        isHot: true,
        category: 'Electronics',
        description: 'Advanced smartwatch with health monitoring',
      ),
      Product(
        id: '3',
        name: 'Wireless Speaker',
        image:
            'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&h=400&fit=crop',
        originalPrice: 15000.00,
        discountedPrice: 9990.00,
        rating: 4.7,
        isHot: true,
        category: 'Electronics',
        description: 'Portable wireless speaker with deep bass',
      ),
    ];
  }

  static List<Product> getPopularProducts() {
    return [
      Product(
        id: '4',
        name: 'Inpods pro Air 13 pods',
        image:
            'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400&h=400&fit=crop',
        originalPrice: 20500.00,
        discountedPrice: 13000.00,
        rating: 4.5,
        isHot: true,
        isNew: true,
        category: 'Electronics',
        description: 'Wireless Bluetooth earbuds with premium sound quality',
      ),
      Product(
        id: '5',
        name: 'Gaming Headset',
        image:
            'https://images.unsplash.com/photo-1599669454699-248893623440?w=400&h=400&fit=crop',
        originalPrice: 12000.00,
        discountedPrice: 8500.00,
        rating: 4.2,
        isHot: true,
        category: 'Electronics',
        description: 'Professional gaming headset with surround sound',
      ),
      Product(
        id: '6',
        name: 'Smartphone X',
        image:
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
        originalPrice: 85000.00,
        discountedPrice: 72000.00,
        rating: 4.8,
        isNew: true,
        category: 'Electronics',
        description: 'Latest smartphone with advanced camera',
      ),
      Product(
        id: '7',
        name: 'Laptop Pro',
        image:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
        originalPrice: 150000.00,
        discountedPrice: 125000.00,
        rating: 4.6,
        isHot: true,
        category: 'Electronics',
        description: 'High-performance laptop for professionals',
      ),
    ];
  }

  static List<Product> getBeautyHealthProducts() {
    return [
      Product(
        id: '8',
        name: 'Face Cream',
        image:
            'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=400&h=400&fit=crop',
        originalPrice: 2500.00,
        discountedPrice: 1800.00,
        rating: 4.4,
        category: 'Beauty & Health',
        description: 'Moisturizing face cream for all skin types',
      ),
      Product(
        id: '9',
        name: 'Vitamin C Serum',
        image:
            'https://images.unsplash.com/photo-1608248543803-ba4f8c70ae0b?w=400&h=400&fit=crop',
        originalPrice: 3500.00,
        discountedPrice: 2800.00,
        rating: 4.7,
        category: 'Beauty & Health',
        description: 'Anti-aging vitamin C serum',
      ),
      Product(
        id: '10',
        name: 'Hair Shampoo',
        image:
            'https://cdn.pixabay.com/photo/2016/11/26/12/52/bottle-1860617_640.png',
        originalPrice: 1200.00,
        discountedPrice: 900.00,
        rating: 4.2,
        category: 'Beauty & Health',
        description: 'Natural hair shampoo for smooth hair',
      ),
    ];
  }

  static List<Product> getClothingProducts() {
    return [
      Product(
        id: '11',
        name: 'Cotton T-Shirt',
        image:
            'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400&h=400&fit=crop',
        originalPrice: 1500.00,
        discountedPrice: 1200.00,
        rating: 4.3,
        category: 'Clothing',
        description: '100% cotton comfortable t-shirt',
      ),
      Product(
        id: '12',
        name: 'Denim Jeans',
        image:
            'https://images.unsplash.com/photo-1542272604-787c3835535d?w=400&h=400&fit=crop',
        originalPrice: 4500.00,
        discountedPrice: 3800.00,
        rating: 4.5,
        category: 'Clothing',
        description: 'Classic denim jeans for everyday wear',
      ),
      Product(
        id: '13',
        name: 'Winter Jacket',
        image:
            'https://images.unsplash.com/photo-1551028719-00167b16eac5?w=400&h=400&fit=crop',
        originalPrice: 8500.00,
        discountedPrice: 7200.00,
        rating: 4.6,
        category: 'Clothing',
        description: 'Warm winter jacket for cold weather',
      ),
    ];
  }

  static List<Product> getSportsProducts() {
    return [
      Product(
        id: '14',
        name: 'Running Shoes',
        image:
            'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=400&fit=crop',
        originalPrice: 6500.00,
        discountedPrice: 5200.00,
        rating: 4.8,
        category: 'Sports',
        description: 'Comfortable running shoes for athletes',
      ),
      Product(
        id: '15',
        name: 'Yoga Mat',
        image:
            'https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=400&h=400&fit=crop',
        originalPrice: 2500.00,
        discountedPrice: 1900.00,
        rating: 4.4,
        category: 'Sports',
        description: 'Non-slip yoga mat for exercise',
      ),
      Product(
        id: '16',
        name: 'Dumbbell Set',
        image:
            'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=400&fit=crop',
        originalPrice: 12000.00,
        discountedPrice: 9800.00,
        rating: 4.7,
        category: 'Sports',
        description: 'Adjustable dumbbell set for home workout',
      ),
    ];
  }

  static List<Product> getAccessoriesProducts() {
    return [
      Product(
        id: '17',
        name: 'Sunglasses',
        image:
            'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400&h=400&fit=crop',
        originalPrice: 3500.00,
        discountedPrice: 2800.00,
        rating: 4.5,
        category: 'Accessories',
        description: 'UV protection sunglasses',
      ),
      Product(
        id: '18',
        name: 'Leather Watch',
        image:
            'https://images.unsplash.com/photo-1523170335258-f5ed11844a49?w=400&h=400&fit=crop',
        originalPrice: 12500.00,
        discountedPrice: 9800.00,
        rating: 4.6,
        category: 'Accessories',
        description: 'Classic leather wrist watch',
      ),
      Product(
        id: '19',
        name: 'Backpack',
        image:
            'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop',
        originalPrice: 4500.00,
        discountedPrice: 3800.00,
        rating: 4.4,
        category: 'Accessories',
        description: 'Waterproof backpack for daily use',
      ),
    ];
  }

  static List<Product> getFashionProducts() {
    return [
      Product(
        id: '20',
        name: 'Designer Dress',
        image:
            'https://cdn.pixabay.com/photo/2016/10/16/23/33/fashion-show-1746592_640.jpg',
        originalPrice: 8500.00,
        discountedPrice: 7200.00,
        rating: 4.7,
        category: 'Fashion',
        description: 'Elegant designer dress for special occasions',
      ),
      Product(
        id: '21',
        name: 'Leather Handbag',
        image:
            'https://cdn.pixabay.com/photo/2015/08/10/20/14/handbag-883113_640.jpg',
        originalPrice: 12500.00,
        discountedPrice: 10500.00,
        rating: 4.8,
        category: 'Fashion',
        description: 'Genuine leather handbag for women',
      ),
      Product(
        id: '22',
        name: 'Formal Shoes',
        image:
            'https://cdn.pixabay.com/photo/2016/03/27/22/16/fashion-1284496_1280.jpg',
        originalPrice: 6500.00,
        discountedPrice: 5200.00,
        rating: 4.5,
        category: 'Fashion',
        description: 'Classic formal shoes for office wear',
      ),
    ];
  }

  // Get products by category
  static List<Product> getProductsByCategory(String category) {
    switch (category) {
      case 'Featured':
        return getPopularProducts();
      case 'Beauty & Health':
        return getBeautyHealthProducts();
      case 'Clothing':
        return getClothingProducts();
      case 'Sports':
        return getSportsProducts();
      case 'Accessories':
        return getAccessoriesProducts();
      case 'Fashion':
        return getFashionProducts();
      default:
        return getPopularProducts();
    }
  }

  // Get all products from all categories (for search)
  static List<Product> getAllProducts() {
    List<Product> allProducts = [
      ...getFlashSaleProducts(),
      ...getPopularProducts(),
      ...getBeautyHealthProducts(),
      ...getClothingProducts(),
      ...getSportsProducts(),
      ...getAccessoriesProducts(),
      ...getFashionProducts(),
    ];

    // Remove duplicates based on product ID
    return allProducts.fold(<Product>[], (list, product) {
      if (!list.any((p) => p.id == product.id)) {
        list.add(product);
      }
      return list;
    });
  }
}
