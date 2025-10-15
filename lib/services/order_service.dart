import '../models/order_model.dart';
import '../models/product_model.dart';

class OrderService {
  static final OrderService _instance = OrderService._internal();
  factory OrderService() => _instance;
  OrderService._internal();

  List<Order> _orders = [];

  List<Order> get orders => List.from(_orders);

  void addOrder(Order order) {
    _orders.insert(0, order);
  }

  void cancelOrder(String orderId) {
    final index = _orders.indexWhere((order) => order.id == orderId);
    if (index != -1) {
      _orders[index] = _orders[index].copyWith(status: OrderStatus.cancelled);
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
