// import 'package:flutter/material.dart';
// import '../models/product_model.dart';
// import 'login_screen.dart'; // Import your existing login screen

// class CartScreen extends StatefulWidget {
//   final List<Product> cartItems;
//   final Function(int) onRemoveFromCart;
//   final Function() onClearCart;

//   const CartScreen({
//     super.key,
//     required this.cartItems,
//     required this.onRemoveFromCart,
//     required this.onClearCart,
//   });

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen>
//     with AutomaticKeepAliveClientMixin {
//   double _totalAmount = 0.0;
//   bool _isLoggedIn = false; // Track login status

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   void initState() {
//     super.initState();
//     _calculateTotal();
//     _checkLoginStatus();
//   }

//   @override
//   void didUpdateWidget(covariant CartScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _calculateTotal();
//   }

//   void _calculateTotal() {
//     _totalAmount = widget.cartItems.fold(
//       0.0,
//       (sum, item) => sum + item.discountedPrice,
//     );
//   }

//   void _checkLoginStatus() {
//     // Replace this with your actual login check logic
//     // For example: Check SharedPreferences, Firebase Auth, etc.
//     // _isLoggedIn = AuthService.isLoggedIn;
//   }

//   void _proceedToCheckout() {
//     if (widget.cartItems.isEmpty) return;

//     // Check if user is logged in
//     if (!_isLoggedIn) {
//       _navigateToLogin();
//       return;
//     }

//     _showPaymentMethods();
//   }

//   void _navigateToLogin() async {
//     // Navigate to your existing login screen and wait for result
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginScreen(), // Your existing login screen
//       ),
//     );

//     // Check if login was successful
//     if (result == true && mounted) {
//       setState(() {
//         _isLoggedIn = true;
//       });
//       // Now show payment methods after successful login
//       _showPaymentMethods();
//     }
//   }

//   void _showPaymentMethods() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) => _buildCheckoutBottomSheet(),
//     );
//   }

//   Widget _buildCheckoutBottomSheet() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       height: MediaQuery.of(context).size.height * 0.7,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Select Payment Method',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),

//           // Card Payment Option
//           _buildPaymentOption(
//             icon: Icons.credit_card,
//             title: 'Credit/Debit Card',
//             subtitle: 'Pay with your card',
//             onTap: () => _processCardPayment(),
//           ),

//           const SizedBox(height: 15),

//           // Cash on Delivery Option
//           _buildPaymentOption(
//             icon: Icons.money,
//             title: 'Cash on Delivery',
//             subtitle: 'Pay when you receive',
//             onTap: () => _processCashOnDelivery(),
//           ),

//           const SizedBox(height: 30),

//           // Order Summary
//           _buildOrderSummary(),

//           const Spacer(),

//           // Confirm Order Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _showOrderConfirmation();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//               ),
//               child: const Text(
//                 'Confirm Order',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPaymentOption({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return Card(
//       elevation: 2,
//       child: ListTile(
//         leading: Icon(icon, color: Colors.blue),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(subtitle),
//         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: onTap,
//       ),
//     );
//   }

//   Widget _buildOrderSummary() {
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Order Summary',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Items Total'),
//                 Text('Rs.${_totalAmount.toStringAsFixed(2)}'),
//               ],
//             ),
//             const SizedBox(height: 5),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [Text('Delivery Fee'), Text('Rs.200.00')],
//             ),
//             const SizedBox(height: 5),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [Text('Tax'), Text('Rs.50.00')],
//             ),
//             const Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Total Amount',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _processCardPayment() {
//     // Implement card payment logic here
//     print('Processing card payment...');
//   }

//   void _processCashOnDelivery() {
//     // Implement cash on delivery logic here
//     print('Processing cash on delivery...');
//   }

//   void _showOrderConfirmation() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Order Confirmed!'),
//         content: const Text('Your order has been placed successfully.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               widget.onClearCart();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cart'),
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         actions: [
//           if (widget.cartItems.isNotEmpty)
//             IconButton(
//               icon: const Icon(Icons.clear_all),
//               onPressed: widget.onClearCart,
//               tooltip: 'Clear Cart',
//             ),
//         ],
//       ),
//       body: widget.cartItems.isEmpty
//           ? _buildEmptyCart()
//           : _buildCartWithItems(),
//       floatingActionButton: widget.cartItems.isNotEmpty
//           ? FloatingActionButton.extended(
//               onPressed: _proceedToCheckout,
//               backgroundColor: const Color.fromARGB(255, 127, 38, 150),
//               icon: const Icon(Icons.shopping_cart_checkout),
//               label: Text(
//                 'Checkout Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
//               ),
//             )
//           : null,
//     );
//   }

//   Widget _buildEmptyCart() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey[400]),
//           const SizedBox(height: 20),
//           const Text(
//             'Your cart is empty',
//             style: TextStyle(fontSize: 18, color: Colors.grey),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             'Add some products to your cart',
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCartWithItems() {
//     return Column(
//       children: [
//         // Show login prompt if not logged in
//         if (!_isLoggedIn) _buildLoginPrompt(),

//         Expanded(
//           child: ListView.builder(
//             padding: const EdgeInsets.all(16.0),
//             itemCount: widget.cartItems.length,
//             itemBuilder: (context, index) {
//               final product = widget.cartItems[index];
//               return _buildCartItem(product, index);
//             },
//           ),
//         ),
//         _buildTotalSection(),
//       ],
//     );
//   }

//   Widget _buildLoginPrompt() {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       margin: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.orange[50],
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.orange),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.info_outline, color: Colors.orange[700]),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Login Required',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.orange[700],
//                   ),
//                 ),
//                 const Text(
//                   'Please login to complete your purchase',
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//           TextButton(onPressed: _navigateToLogin, child: const Text('Login')),
//         ],
//       ),
//     );
//   }

//   Widget _buildCartItem(Product product, int index) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: ListTile(
//         leading: Container(
//           width: 50,
//           height: 50,
//           color: Colors.grey[200],
//           child: Icon(Icons.shopping_bag, color: Colors.grey[400]),
//         ),
//         title: Text(
//           product.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Rs.${product.discountedPrice.toStringAsFixed(2)}'),
//             if (product.discountPercentage > 0)
//               Text(
//                 '${product.discountPercentage.toStringAsFixed(0)}% OFF',
//                 style: const TextStyle(color: Colors.green),
//               ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
//           onPressed: () => widget.onRemoveFromCart(index),
//         ),
//       ),
//     );
//   }

//   Widget _buildTotalSection() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text('Items Total', style: TextStyle(fontSize: 16)),
//               Text(
//                 'Rs.${_totalAmount.toStringAsFixed(2)}',
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [Text('Delivery + Tax'), Text('Rs.250.00')],
//           ),
//           const Divider(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Total',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'login_screen.dart';

// Card Payment Screen
class CardPaymentScreen extends StatefulWidget {
  final double totalAmount;
  final Function() onOrderConfirmed;

  const CardPaymentScreen({
    super.key,
    required this.totalAmount,
    required this.onOrderConfirmed,
  });

  @override
  _CardPaymentScreenState createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Payment'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isProcessing ? _buildProcessingScreen() : _buildPaymentForm(),
    );
  }

  Widget _buildProcessingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20),
          const Text(
            'Processing Payment...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Rs.${(widget.totalAmount + 250).toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Order Total',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Rs.${(widget.totalAmount + 250).toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Card Number
            TextFormField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                hintText: '1234 5678 9012 3456',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.credit_card),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter card number';
                }
                if (value.replaceAll(' ', '').length != 16) {
                  return 'Please enter valid card number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Row for Expiry Date and CVV
            Row(
              children: [
                // Expiry Date
                Expanded(
                  child: TextFormField(
                    controller: _expiryDateController,
                    decoration: const InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter expiry date';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),

                // CVV
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      hintText: '123',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter CVV';
                      }
                      if (value.length != 3) {
                        return 'Please enter valid CVV';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Card Holder Name
            TextFormField(
              controller: _cardHolderNameController,
              decoration: const InputDecoration(
                labelText: 'Card Holder Name',
                hintText: 'John Doe',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter card holder name';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            // Pay Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });

      // Simulate payment processing
      Future.delayed(const Duration(seconds: 3), () {
        widget.onOrderConfirmed();
        Navigator.pop(context);
      });
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }
}

// Cash on Delivery Screen
class CashOnDeliveryScreen extends StatefulWidget {
  final double totalAmount;
  final List<Product> cartItems;
  final Function() onOrderConfirmed;

  const CashOnDeliveryScreen({
    super.key,
    required this.totalAmount,
    required this.cartItems,
    required this.onOrderConfirmed,
  });

  @override
  _CashOnDeliveryScreenState createState() => _CashOnDeliveryScreenState();
}

class _CashOnDeliveryScreenState extends State<CashOnDeliveryScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash on Delivery'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Card
            Card(
              elevation: 2,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context, index) {
                        final product = widget.cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              Text(
                                'Rs.${product.discountedPrice.toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery + Tax'),
                        Text('Rs.250.00'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Amount',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Rs.${(widget.totalAmount + 250).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Delivery Information
            const Text(
              'Delivery Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name *',
                hintText: 'Enter your full name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Phone Number
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number *',
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            // Address
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Delivery Address *',
                hintText: 'Enter your complete address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                alignLabelWithHint: true,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Additional Notes
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Additional Notes (Optional)',
                hintText: 'Any special instructions for delivery',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.note),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                alignLabelWithHint: true,
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 24),

            // Important Note
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.orange[700], size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'You will pay Rs.${(widget.totalAmount + 250).toStringAsFixed(2)} when you receive your order.',
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Confirm Order Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirmOrder,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 127, 38, 150),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm Order',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _confirmOrder() {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty) {
      _showErrorDialog('Please fill all required fields');
      return;
    }

    _showConfirmationDialog();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Missing Information'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Are you sure you want to place this order?'),
            const SizedBox(height: 12),
            Text(
              'Amount to pay: Rs.${(widget.totalAmount + 250).toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            const Text('Payment: Cash on Delivery'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              widget.onOrderConfirmed();
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}

// Main Cart Screen - Fully Fixed
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
  bool _isLoggedIn = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
    _checkLoginStatus();
  }

  @override
  void didUpdateWidget(covariant CartScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cartItems.length != widget.cartItems.length ||
        _hasCartItemsChanged(oldWidget.cartItems, widget.cartItems)) {
      _calculateTotal();
    }
  }

  bool _hasCartItemsChanged(List<Product> oldItems, List<Product> newItems) {
    if (oldItems.length != newItems.length) return true;

    for (int i = 0; i < oldItems.length; i++) {
      if (oldItems[i].id != newItems[i].id ||
          oldItems[i].discountedPrice != newItems[i].discountedPrice) {
        return true;
      }
    }
    return false;
  }

  void _calculateTotal() {
    double newTotal = widget.cartItems.fold(
      0.0,
      (sum, item) => sum + item.discountedPrice,
    );

    if (mounted && newTotal != _totalAmount) {
      setState(() {
        _totalAmount = newTotal;
      });
    }
  }

  void _checkLoginStatus() {
    _isLoggedIn = true;
  }

  void _proceedToCheckout() {
    if (widget.cartItems.isEmpty) return;
    _showPaymentMethods();
  }

  void _showPaymentMethods() {
    // Ensure total is up to date before showing bottom sheet
    _calculateTotal();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildCheckoutBottomSheet(),
    );
  }

  Widget _buildCheckoutBottomSheet() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
            onTap: () {
              Navigator.pop(context);
              _navigateToCardPayment();
            },
          ),

          const SizedBox(height: 12),

          // Cash on Delivery Option
          _buildPaymentOption(
            icon: Icons.money,
            title: 'Cash on Delivery',
            subtitle: 'Pay when you receive',
            onTap: () {
              Navigator.pop(context);
              _navigateToCashOnDelivery();
            },
          ),

          const SizedBox(height: 24),

          // Order Summary
          _buildOrderSummary(),

          const Spacer(),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Select a payment method to continue',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12),
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
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, color: Colors.blue, size: 24),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Items Total', style: TextStyle(fontSize: 14)),
                Text(
                  'Rs.${_totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Delivery Fee', style: TextStyle(fontSize: 14)),
                Text('Rs.200.00', style: TextStyle(fontSize: 14)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Tax', style: TextStyle(fontSize: 14)),
                Text('Rs.50.00', style: TextStyle(fontSize: 14)),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToCardPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CardPaymentScreen(
          totalAmount: _totalAmount,
          onOrderConfirmed: _onOrderConfirmed,
        ),
      ),
    );
  }

  void _navigateToCashOnDelivery() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CashOnDeliveryScreen(
          totalAmount: _totalAmount,
          cartItems: widget.cartItems,
          onOrderConfirmed: _onOrderConfirmed,
        ),
      ),
    );
  }

  void _onOrderConfirmed() {
    widget.onClearCart();
    _showOrderConfirmation();
  }

  void _showOrderConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Order Confirmed!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Your order has been placed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
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

    // Ensure total is calculated on every build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTotal();
    });

    final double checkoutTotal = _totalAmount + 250;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (widget.cartItems.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all, color: Colors.red),
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
              icon: const Icon(
                Icons.shopping_cart_checkout,
                color: Colors.white,
              ),
              label: Text(
                'Checkout Rs.${checkoutTotal.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
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
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.shopping_bag, color: Colors.grey[600]),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rs.${product.discountedPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 14),
            ),
            if (product.discountPercentage > 0)
              Text(
                '${product.discountPercentage.toStringAsFixed(0)}% OFF',
                style: const TextStyle(color: Colors.green, fontSize: 12),
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
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Items Total', style: TextStyle(fontSize: 14)),
              Text(
                'Rs.${_totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Delivery + Tax', style: TextStyle(fontSize: 14)),
              Text('Rs.250.00', style: TextStyle(fontSize: 14)),
            ],
          ),
          const Divider(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rs.${(_totalAmount + 250).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
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
