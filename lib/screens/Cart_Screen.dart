import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;
  final Function(int) onRemoveFromCart;
  final Function() onClearCart;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onRemoveFromCart,
    required this.onClearCart,
  });

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin {
  double _totalAmount = 0.0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _calculateTotal();
  }

  void _calculateTotal() {
    _totalAmount = widget.cartItems.fold(
      0.0,
      (sum, item) => sum + item.discountedPrice,
    );
  }

  void _proceedToCheckout() {
    if (widget.cartItems.isEmpty) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _buildCheckoutBottomSheet(),
    );
  }

  Widget _buildCheckoutBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Payment Method',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Card Payment Option
          _buildPaymentOption(
            icon: Icons.credit_card,
            title: 'Credit/Debit Card',
            subtitle: 'Pay with your card',
            onTap: () => _processCardPayment(),
          ),

          const SizedBox(height: 15),

          // Cash on Delivery Option
          _buildPaymentOption(
            icon: Icons.money,
            title: 'Cash on Delivery',
            subtitle: 'Pay when you receive',
            onTap: () => _processCashOnDelivery(),
          ),

          const SizedBox(height: 30),

          // Order Summary
          _buildOrderSummary(),

          const Spacer(),

          // Confirm Order Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showOrderConfirmation();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Confirm Order',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Items Total'),
                Text('Rs.${_totalAmount.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Delivery Fee'), const Text('Rs.200.00')],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text('Tax'), const Text('Rs.50.00')],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _processCardPayment() {
    // Implement card payment logic here
    print('Processing card payment...');
  }

  void _processCashOnDelivery() {
    // Implement cash on delivery logic here
    print('Processing cash on delivery...');
  }

  void _showOrderConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Confirmed!'),
        content: const Text('Your order has been placed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onClearCart();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color.fromARGB(255, 127, 38, 150),
        actions: [
          if (widget.cartItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: widget.onClearCart,
              tooltip: 'Clear Cart',
            ),
        ],
      ),
      body: widget.cartItems.isEmpty
          ? _buildEmptyCart()
          : _buildCartWithItems(),
      floatingActionButton: widget.cartItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _proceedToCheckout,
              backgroundColor: const Color.fromARGB(255, 127, 38, 150),
              icon: const Icon(Icons.shopping_cart_checkout),
              label: Text(
                'Checkout Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
              ),
            )
          : null,
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 20),
          const Text(
            'Your cart is empty',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          const Text(
            'Add some products to your cart',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCartWithItems() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final product = widget.cartItems[index];
              return _buildCartItem(product, index);
            },
          ),
        ),
        _buildTotalSection(),
      ],
    );
  }

  Widget _buildCartItem(Product product, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey[200],
          child: Icon(Icons.shopping_bag, color: Colors.grey[400]),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rs.${product.discountedPrice.toStringAsFixed(2)}'),
            if (product.discountPercentage > 0)
              Text(
                '${product.discountPercentage.toStringAsFixed(0)}% OFF',
                style: const TextStyle(color: Colors.green),
              ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
          onPressed: () => widget.onRemoveFromCart(index),
        ),
      ),
    );
  }

  Widget _buildTotalSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Items Total', style: TextStyle(fontSize: 16)),
              Text(
                'Rs.${_totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Delivery + Tax'), const Text('Rs.250.00')],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
