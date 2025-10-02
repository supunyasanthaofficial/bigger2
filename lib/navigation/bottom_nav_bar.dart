import 'package:flutter/material.dart';
import '../screens/Home_Screen.dart';
import '../screens/Menu_Screen.dart';
import '../screens/Cart_Screen.dart';
import '../screens/Profile_Screen.dart';
import '../models/product_model.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Product> _cartItems = [];

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
    });
  }

  int get _cartItemCount => _cartItems.length;

  Widget _buildCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen(
          key: const ValueKey('HomeScreen'),
          onAddToCart: _addToCart,
        );
      case 1:
        return const MenuScreen(key: ValueKey('MenuScreen'));
      case 2:
        return CartScreen(
          key: const ValueKey('CartScreen'),
          cartItems: _cartItems,
          onRemoveFromCart: _removeFromCart,
          onClearCart: _clearCart,
        );
      case 3:
        return const ProfileScreen(key: ValueKey('ProfileScreen'));
      default:
        return HomeScreen(
          key: const ValueKey('HomeScreen'),
          onAddToCart: _addToCart,
        );
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey<ScaffoldState>(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) {
          final slideAnimation =
              Tween<Offset>(
                begin: const Offset(0.3, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );

          final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          );

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
        child: _buildCurrentScreen(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 84, 105, 199),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            selectedIconTheme: const IconThemeData(size: 28),
            unselectedIconTheme: IconThemeData(
              size: 26,
              color: Colors.grey[300],
            ),
            iconSize: 26,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11,
              color: Colors.grey[300],
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 10,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == 0
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: _currentIndex == 0
                            ? Colors.white
                            : Colors.grey[300],
                      ),
                      if (_currentIndex == 0)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: const Icon(Icons.home, color: Colors.white),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == 1
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.menu_outlined,
                        color: _currentIndex == 1
                            ? Colors.white
                            : Colors.grey[300],
                      ),
                      if (_currentIndex == 1)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: const Icon(Icons.menu, color: Colors.white),
                ),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == 2
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Badge(
                        smallSize: 16,
                        backgroundColor: Colors.red,
                        label: Text(
                          _cartItemCount > 0 ? _cartItemCount.toString() : '0',
                          style: const TextStyle(fontSize: 10),
                        ),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: _currentIndex == 2
                              ? Colors.white
                              : Colors.grey[300],
                        ),
                      ),
                      if (_currentIndex == 2)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Badge(
                    smallSize: 16,
                    backgroundColor: Colors.red,
                    label: Text(
                      _cartItemCount > 0 ? _cartItemCount.toString() : '0',
                      style: const TextStyle(fontSize: 10),
                    ),
                    child: const Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == 3
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                  ),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.person_outline,
                        color: _currentIndex == 3
                            ? Colors.white
                            : Colors.grey[300],
                      ),
                      if (_currentIndex == 3)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                activeIcon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
