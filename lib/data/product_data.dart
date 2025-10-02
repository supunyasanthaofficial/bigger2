import '../models/product_model.dart';

class ProductData {
  static List<Product> getFlashSaleProducts() {
    return [
      Product(
        id: '1',
        name: 'Inpods pro Air 13 pods',
        image: 'assets/images/airpods.png',
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
        image: 'assets/images/smartwatch.png',
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
        image: 'assets/images/speaker.png',
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
        image: 'assets/images/airpods.png',
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
        image: 'assets/images/headset.png',
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
        image: 'assets/images/phone.png',
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
        image: 'assets/images/laptop.png',
        originalPrice: 150000.00,
        discountedPrice: 125000.00,
        rating: 4.6,
        isHot: true,
        category: 'Electronics',
        description: 'High-performance laptop for professionals',
      ),
    ];
  }

  // Add category-specific products
  static List<Product> getBeautyHealthProducts() {
    return [
      Product(
        id: '8',
        name: 'Face Cream',
        image: 'assets/images/face_cream.png',
        originalPrice: 2500.00,
        discountedPrice: 1800.00,
        rating: 4.4,
        category: 'Beauty & Health',
        description: 'Moisturizing face cream for all skin types',
      ),
      Product(
        id: '9',
        name: 'Vitamin C Serum',
        image: 'assets/images/serum.png',
        originalPrice: 3500.00,
        discountedPrice: 2800.00,
        rating: 4.7,
        category: 'Beauty & Health',
        description: 'Anti-aging vitamin C serum',
      ),
      Product(
        id: '10',
        name: 'Hair Shampoo',
        image: 'assets/images/shampoo.png',
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
        image: 'assets/images/tshirt.png',
        originalPrice: 1500.00,
        discountedPrice: 1200.00,
        rating: 4.3,
        category: 'Clothing',
        description: '100% cotton comfortable t-shirt',
      ),
      Product(
        id: '12',
        name: 'Denim Jeans',
        image: 'assets/images/jeans.png',
        originalPrice: 4500.00,
        discountedPrice: 3800.00,
        rating: 4.5,
        category: 'Clothing',
        description: 'Classic denim jeans for everyday wear',
      ),
      Product(
        id: '13',
        name: 'Winter Jacket',
        image: 'assets/images/jacket.png',
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
        image: 'assets/images/shoes.png',
        originalPrice: 6500.00,
        discountedPrice: 5200.00,
        rating: 4.8,
        category: 'Sports',
        description: 'Comfortable running shoes for athletes',
      ),
      Product(
        id: '15',
        name: 'Yoga Mat',
        image: 'assets/images/yogamat.png',
        originalPrice: 2500.00,
        discountedPrice: 1900.00,
        rating: 4.4,
        category: 'Sports',
        description: 'Non-slip yoga mat for exercise',
      ),
      Product(
        id: '16',
        name: 'Dumbbell Set',
        image: 'assets/images/dumbbell.png',
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
        image: 'assets/images/sunglasses.png',
        originalPrice: 3500.00,
        discountedPrice: 2800.00,
        rating: 4.5,
        category: 'Accessories',
        description: 'UV protection sunglasses',
      ),
      Product(
        id: '18',
        name: 'Leather Watch',
        image: 'assets/images/watch.png',
        originalPrice: 12500.00,
        discountedPrice: 9800.00,
        rating: 4.6,
        category: 'Accessories',
        description: 'Classic leather wrist watch',
      ),
      Product(
        id: '19',
        name: 'Backpack',
        image: 'assets/images/backpack.png',
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
        image: 'assets/images/dress.png',
        originalPrice: 8500.00,
        discountedPrice: 7200.00,
        rating: 4.7,
        category: 'Fashion',
        description: 'Elegant designer dress for special occasions',
      ),
      Product(
        id: '21',
        name: 'Leather Handbag',
        image: 'assets/images/handbag.png',
        originalPrice: 12500.00,
        discountedPrice: 10500.00,
        rating: 4.8,
        category: 'Fashion',
        description: 'Genuine leather handbag for women',
      ),
      Product(
        id: '22',
        name: 'Formal Shoes',
        image: 'assets/images/formalshoes.png',
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
}
