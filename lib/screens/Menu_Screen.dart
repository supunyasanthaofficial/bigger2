import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../data/product_data.dart';
import './product_datails_screen.dart';

class MenuScreen extends StatefulWidget {
  final Function(Product)? onAddToCart;

  const MenuScreen({super.key, this.onAddToCart});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadAllProducts();
  }

  void _loadAllProducts() {
    _allProducts = ProductData.getAllProducts();
    _filteredProducts = [];
  }

  void _searchProducts(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;

      if (query.isEmpty) {
        _filteredProducts = [];
      } else {
        _filteredProducts = _allProducts.where((product) {
          return product.name.toLowerCase().contains(query.toLowerCase()) ||
              product.category.toLowerCase().contains(query.toLowerCase()) ||
              product.description.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _isSearching = false;
      _filteredProducts = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),
          // Content based on search state
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(Icons.search, color: Colors.grey[500]),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search for products, categories...',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        border: InputBorder.none,
                      ),
                      onChanged: _searchProducts,
                    ),
                  ),
                  if (_isSearching)
                    IconButton(
                      icon: Icon(Icons.clear, color: Colors.grey[500]),
                      onPressed: _clearSearch,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isSearching) {
      // Show products only when searching
      return _buildSearchResults();
    } else {
      // Show banners only when not searching
      return _buildBanners();
    }
  }

  Widget _buildBanners() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Banner 1 - Skincare
          _buildBanner(
            title: "Glow Naturally,\nShine Daily\nwith Our\nSkincare.",
            buttonText: "Shop Now",
            backgroundColor: Colors.pink[50]!,
            textColor: Colors.pink[800]!,
            buttonColor: Colors.pink,
          ),
          const SizedBox(height: 16),

          // Banner 2 - Innovation
          _buildBanner(
            title: "Power Up Your\nDay with\nInnovation.",
            buttonText: "Shop Now",
            backgroundColor: Colors.blue[50]!,
            textColor: Colors.blue[800]!,
            buttonColor: Colors.blue,
          ),
          const SizedBox(height: 16),

          // Banner 3 - Style & Comfort
          _buildBanner(
            title: "Style That\nSpeaks,\nComfort That\nStays",
            buttonText: "Shop Now",
            backgroundColor: Colors.purple[50]!,
            textColor: Colors.purple[800]!,
            buttonColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildBanner({
    required String title,
    required String buttonText,
    required Color backgroundColor,
    required Color textColor,
    required Color buttonColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: textColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.shopping_bag, color: textColor, size: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_filteredProducts.isEmpty) {
      return _buildNoResults();
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: _filteredProducts.length,
      itemBuilder: (context, index) {
        final product = _filteredProducts[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 20),
          const Text(
            'No products found',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Text(
            'Try searching with different keywords',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Widget _buildProductCard(Product product) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => ProductDetailsScreen(
  //             product: product,
  //             onAddToCart: widget.onAddToCart,
  //           ),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(12),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.1),
  //             blurRadius: 8,
  //             offset: const Offset(0, 2),
  //           ),
  //         ],
  //         border: Border.all(color: Colors.grey[200]!),
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Stack(
  //             children: [
  //               Container(
  //                 height: 120,
  //                 width: double.infinity,
  //                 decoration: BoxDecoration(
  //                   color: Colors.grey[100],
  //                   borderRadius: const BorderRadius.only(
  //                     topLeft: Radius.circular(12),
  //                     topRight: Radius.circular(12),
  //                   ),
  //                 ),
  //                 child: Icon(
  //                   Icons.shopping_bag,
  //                   size: 40,
  //                   color: Colors.grey[400],
  //                 ),
  //               ),
  //               Positioned(
  //                 top: 8,
  //                 left: 8,
  //                 child: Row(
  //                   children: [
  //                     if (product.isHot)
  //                       Container(
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 6,
  //                           vertical: 2,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: Colors.red,
  //                           borderRadius: BorderRadius.circular(4),
  //                         ),
  //                         child: const Text(
  //                           'HOT',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 8,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     if (product.isHot && product.isNew)
  //                       const SizedBox(width: 4),
  //                     if (product.isNew)
  //                       Container(
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 6,
  //                           vertical: 2,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: Colors.green,
  //                           borderRadius: BorderRadius.circular(4),
  //                         ),
  //                         child: const Text(
  //                           'NEW',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 8,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(12),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   product.name,
  //                   style: const TextStyle(
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 12,
  //                   ),
  //                   maxLines: 2,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Text(
  //                   product.category,
  //                   style: TextStyle(color: Colors.grey[600], fontSize: 10),
  //                 ),
  //                 const SizedBox(height: 8),
  //                 Row(
  //                   children: [
  //                     Text(
  //                       'Rs.${product.discountedPrice.toStringAsFixed(2)}',
  //                       style: const TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.red,
  //                         fontSize: 14,
  //                       ),
  //                     ),
  //                     const SizedBox(width: 8),
  //                     Text(
  //                       'Rs.${product.originalPrice.toStringAsFixed(2)}',
  //                       style: TextStyle(
  //                         decoration: TextDecoration.lineThrough,
  //                         color: Colors.grey[500],
  //                         fontSize: 11,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 4),
  //                 Row(
  //                   children: [
  //                     Icon(Icons.star, color: Colors.amber, size: 12),
  //                     const SizedBox(width: 2),
  //                     Text(
  //                       product.rating.toString(),
  //                       style: TextStyle(color: Colors.grey[600], fontSize: 10),
  //                     ),
  //                     const Spacer(),
  //                     Container(
  //                       padding: const EdgeInsets.symmetric(
  //                         horizontal: 6,
  //                         vertical: 2,
  //                       ),
  //                       decoration: BoxDecoration(
  //                         color: Colors.blue[50],
  //                         borderRadius: BorderRadius.circular(4),
  //                       ),
  //                       child: Text(
  //                         '-${product.discountPercentage.toStringAsFixed(0)}%',
  //                         style: const TextStyle(
  //                           color: Colors.blue,
  //                           fontSize: 10,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
              onAddToCart: widget.onAddToCart,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Image Container - Updated
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      product.image,
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(
                            Icons.shopping_bag,
                            size: 40,
                            color: Colors.grey[400],
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Row(
                    children: [
                      if (product.isHot)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'HOT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (product.isHot && product.isNew)
                        const SizedBox(width: 4),
                      if (product.isNew)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            // Rest of the code remains same...
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.category,
                    style: TextStyle(color: Colors.grey[600], fontSize: 10),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Rs.${product.discountedPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Rs.${product.originalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey[500],
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toString(),
                        style: TextStyle(color: Colors.grey[600], fontSize: 10),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '-${product.discountPercentage.toStringAsFixed(0)}%',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
