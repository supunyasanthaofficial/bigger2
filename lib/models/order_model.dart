// models/order_model.dart
import 'package:flutter/material.dart';

enum OrderStatus {
  pending,
  confirmed, // Fixed typo
  processing,
  shipped,
  delivered,
  cancelled,
}

class Order {
  final String id;
  final DateTime date;
  final OrderStatus status;
  final double totalAmount;
  final List<OrderItem> items;
  final String? shippingAddress;
  final String? paymentMethod;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.totalAmount,
    required this.items,
    this.shippingAddress,
    this.paymentMethod,
  });

  String get statusText {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get statusColor {
    switch (status) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.confirmed:
        return Colors.blue;
      case OrderStatus.processing:
        return Colors.purple;
      case OrderStatus.shipped:
        return Colors.indigo;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'status': status.index,
      'totalAmount': totalAmount,
      'items': items.map((item) => item.toMap()).toList(),
      'shippingAddress': shippingAddress,
      'paymentMethod': paymentMethod,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      date: DateTime.parse(map['date'] ?? DateTime.now().toIso8601String()),
      status: OrderStatus.values[map['status'] ?? 0],
      totalAmount: (map['totalAmount'] ?? 0.0).toDouble(),
      items: List<OrderItem>.from(
        (map['items'] ?? []).map((item) => OrderItem.fromMap(item)),
      ),
      shippingAddress: map['shippingAddress'],
      paymentMethod: map['paymentMethod'],
    );
  }

  Order copyWith({
    String? id,
    DateTime? date,
    OrderStatus? status,
    double? totalAmount,
    List<OrderItem>? items,
    String? shippingAddress,
    String? paymentMethod,
  }) {
    return Order(
      id: id ?? this.id,
      date: date ?? this.date,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      items: items ?? this.items,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'price': price,
      'quantity': quantity,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      productId: map['productId'] ?? '',
      productName: map['productName'] ?? '',
      productImage: map['productImage'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      quantity: map['quantity'] ?? 1,
    );
  }
}
