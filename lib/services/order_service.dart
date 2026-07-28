import '../models/order_model.dart';
import '../models/product_model.dart';
import 'database_service.dart';

class OrderService {
  static final OrderService _instance = OrderService._internal();
  factory OrderService() => _instance;
  OrderService._internal();

  final DatabaseService _dbService = DatabaseService();
  final List<Order> _localOrders = [];

  List<Order> get orders => List.from(_localOrders);

  Future<void> addOrder(Order order) async {
    try {
      await _dbService.createOrder(order);
      _localOrders.insert(0, order);
    } catch (e) {
      print('Error adding order: $e');
      // Still add to local orders even if database fails
      _localOrders.insert(0, order);
    }
  }

  Future<void> cancelOrder(String orderId) async {
    try {
      await _dbService.updateOrderStatus(orderId, OrderStatus.cancelled);
      final index = _localOrders.indexWhere((order) => order.id == orderId);
      if (index != -1) {
        _localOrders[index] = _localOrders[index].copyWith(
          status: OrderStatus.cancelled,
        );
      }
    } catch (e) {
      print('Error cancelling order: $e');
      // Still update local orders even if database fails
      final index = _localOrders.indexWhere((order) => order.id == orderId);
      if (index != -1) {
        _localOrders[index] = _localOrders[index].copyWith(
          status: OrderStatus.cancelled,
        );
      }
    }
  }

  Future<void> loadUserOrders() async {
    try {
      final orders = await _dbService.getUserOrders();
      _localOrders.clear();
      _localOrders.addAll(orders);
    } catch (e) {
      print('Error loading user orders: $e');
    }
  }

  Order createOrderFromProducts({
    required List<Product> products,
    required double totalAmount,
    required String paymentMethod,
    required Map<String, String> shippingInfo,
  }) {
    final orderItems = products
        .map(
          (product) => OrderItem(
            productId: product.id,
            productName: product.name,
            productImage: product.image,
            price: product.discountedPrice,
            quantity: 1,
          ),
        )
        .toList();

    return Order(
      id: 'ORD${DateTime.now().millisecondsSinceEpoch}',
      date: DateTime.now(),
      status: OrderStatus.pending,
      totalAmount: totalAmount + 250,
      items: orderItems,
      shippingAddress: _formatShippingAddress(shippingInfo),
      paymentMethod: paymentMethod,
    );
  }

  String _formatShippingAddress(Map<String, String> shippingInfo) {
    return '''
${shippingInfo['firstName']} ${shippingInfo['lastName']}
${shippingInfo['address']}
${shippingInfo['city']}, ${shippingInfo['region']}
${shippingInfo['country']} ${shippingInfo['postalCode']}
Phone: ${shippingInfo['phone']}
Email: ${shippingInfo['email']}
''';
  }
}
