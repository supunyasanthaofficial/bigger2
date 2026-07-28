import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  final SupabaseClient _supabase = SupabaseClient(
    SupabaseConfig.url,
    SupabaseConfig.anonKey,
  );

  SupabaseClient get client => _supabase;

  // Fallback data in case Supabase is not configured
  List<Category> _getFallbackCategories() {
    return [
      Category(id: '1', name: 'Featured', icon: '⭐', itemCount: 4),
      Category(id: '2', name: 'Beauty & Health', icon: '💄', itemCount: 3),
      Category(id: '3', name: 'Clothing', icon: '👕', itemCount: 3),
      Category(id: '4', name: 'Sports', icon: '⚽', itemCount: 3),
      Category(id: '5', name: 'Accessories', icon: '🕶️', itemCount: 3),
      Category(id: '6', name: 'Fashion', icon: '👠', itemCount: 3),
    ];
  }

  List<Product> _getFallbackProducts() {
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
    ];
  }

  Future<List<Category>> getCategories() async {
    try {
      // Check if Supabase is configured
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return _getFallbackCategories();
      }

      final response = await _supabase
          .from('categories')
          .select()
          .order('name');

      if (response == null || response.isEmpty) {
        return _getFallbackCategories();
      }

      return (response as List)
          .map(
            (category) => Category.fromMap({
              'id': category['id'] ?? '',
              'name': category['name'] ?? '',
              'icon': category['icon'] ?? '',
              'item_count': category['item_count'] ?? 0,
            }),
          )
          .toList();
    } catch (e) {
      print('Error fetching categories: $e');
      return _getFallbackCategories();
    }
  }

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return _getFallbackProducts()
            .where((product) => product.category == categoryName)
            .toList();
      }

      final response = await _supabase
          .from('products')
          .select()
          .eq('category', categoryName);

      if (response == null || response.isEmpty) {
        return _getFallbackProducts()
            .where((product) => product.category == categoryName)
            .toList();
      }

      return (response as List)
          .map(
            (product) => Product.fromMap({
              'id': product['id'] ?? '',
              'name': product['name'] ?? '',
              'image': product['image'] ?? '',
              'original_price': product['original_price'] ?? 0.0,
              'discounted_price': product['discounted_price'] ?? 0.0,
              'rating': product['rating'] ?? 0.0,
              'is_hot': product['is_hot'] ?? false,
              'is_new': product['is_new'] ?? false,
              'category': product['category'] ?? '',
              'description': product['description'] ?? '',
            }),
          )
          .toList();
    } catch (e) {
      print('Error fetching products by category: $e');
      return _getFallbackProducts()
          .where((product) => product.category == categoryName)
          .toList();
    }
  }

  Future<List<Product>> getAllProducts() async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return _getFallbackProducts();
      }

      final response = await _supabase.from('products').select().order('name');

      if (response == null || response.isEmpty) {
        return _getFallbackProducts();
      }

      return (response as List)
          .map(
            (product) => Product.fromMap({
              'id': product['id'] ?? '',
              'name': product['name'] ?? '',
              'image': product['image'] ?? '',
              'original_price': product['original_price'] ?? 0.0,
              'discounted_price': product['discounted_price'] ?? 0.0,
              'rating': product['rating'] ?? 0.0,
              'is_hot': product['is_hot'] ?? false,
              'is_new': product['is_new'] ?? false,
              'category': product['category'] ?? '',
              'description': product['description'] ?? '',
            }),
          )
          .toList();
    } catch (e) {
      print('Error fetching all products: $e');
      return _getFallbackProducts();
    }
  }

  Future<List<Product>> getFlashSaleProducts() async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return _getFallbackProducts()
            .where((product) => product.isHot)
            .take(3)
            .toList();
      }

      final response = await _supabase
          .from('products')
          .select()
          .eq('is_hot', true)
          .limit(3);

      if (response == null || response.isEmpty) {
        return _getFallbackProducts()
            .where((product) => product.isHot)
            .take(3)
            .toList();
      }

      return (response as List)
          .map(
            (product) => Product.fromMap({
              'id': product['id'] ?? '',
              'name': product['name'] ?? '',
              'image': product['image'] ?? '',
              'original_price': product['original_price'] ?? 0.0,
              'discounted_price': product['discounted_price'] ?? 0.0,
              'rating': product['rating'] ?? 0.0,
              'is_hot': product['is_hot'] ?? false,
              'is_new': product['is_new'] ?? false,
              'category': product['category'] ?? '',
              'description': product['description'] ?? '',
            }),
          )
          .toList();
    } catch (e) {
      print('Error fetching flash sale products: $e');
      return _getFallbackProducts()
          .where((product) => product.isHot)
          .take(3)
          .toList();
    }
  }

  Future<List<Product>> getPopularProducts() async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return _getFallbackProducts();
      }

      final response = await _supabase
          .from('products')
          .select()
          .or('is_hot.eq.true,is_new.eq.true')
          .order('rating', ascending: false)
          .limit(4);

      if (response == null || response.isEmpty) {
        return _getFallbackProducts();
      }

      return (response as List)
          .map(
            (product) => Product.fromMap({
              'id': product['id'] ?? '',
              'name': product['name'] ?? '',
              'image': product['image'] ?? '',
              'original_price': product['original_price'] ?? 0.0,
              'discounted_price': product['discounted_price'] ?? 0.0,
              'rating': product['rating'] ?? 0.0,
              'is_hot': product['is_hot'] ?? false,
              'is_new': product['is_new'] ?? false,
              'category': product['category'] ?? '',
              'description': product['description'] ?? '',
            }),
          )
          .toList();
    } catch (e) {
      print('Error fetching popular products: $e');
      return _getFallbackProducts();
    }
  }

  Future<String> createOrder(Order order) async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return order.id; // Return order ID without saving to database
      }

      // Insert order
      final orderResponse = await _supabase.from('orders').insert({
        'id': order.id,
        'user_id': 'current_user',
        'status': order.status.index,
        'total_amount': order.totalAmount,
        'shipping_address': order.shippingAddress,
        'payment_method': order.paymentMethod,
      }).select();

      // Insert order items
      for (final item in order.items) {
        await _supabase.from('order_items').insert({
          'order_id': order.id,
          'product_id': item.productId,
          'product_name': item.productName,
          'product_image': item.productImage,
          'price': item.price,
          'quantity': item.quantity,
        });
      }

      return order.id;
    } catch (e) {
      print('Error creating order: $e');
      return order.id; // Still return order ID even if database fails
    }
  }

  Future<List<Order>> getUserOrders() async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return [];
      }

      final response = await _supabase
          .from('orders')
          .select('''
            *,
            order_items (*)
          ''')
          .eq('user_id', 'current_user')
          .order('date', ascending: false);

      if (response == null || response.isEmpty) {
        return [];
      }

      return (response as List).map((orderData) {
        final items = (orderData['order_items'] as List)
            .map(
              (item) => OrderItem(
                productId: item['product_id'] ?? '',
                productName: item['product_name'] ?? '',
                productImage: item['product_image'] ?? '',
                price: (item['price'] ?? 0.0).toDouble(),
                quantity: item['quantity'] ?? 1,
              ),
            )
            .toList();

        return Order(
          id: orderData['id'] ?? '',
          date: DateTime.parse(
            orderData['date'] ?? DateTime.now().toIso8601String(),
          ),
          status: OrderStatus.values[orderData['status'] ?? 0],
          totalAmount: (orderData['total_amount'] ?? 0.0).toDouble(),
          items: items,
          shippingAddress: orderData['shipping_address'],
          paymentMethod: orderData['payment_method'],
        );
      }).toList();
    } catch (e) {
      print('Error fetching user orders: $e');
      return [];
    }
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus status) async {
    try {
      if (SupabaseConfig.url.contains('your-project-ref')) {
        return; // Do nothing if Supabase is not configured
      }

      await _supabase
          .from('orders')
          .update({'status': status.index})
          .eq('id', orderId);
    } catch (e) {
      print('Error updating order status: $e');
    }
  }
}
