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

  // Banner images URLs
  final List<Map<String, dynamic>> _banners = [
    {
      'title': "Glow Naturally,\nShine Daily\nwith Our\nSkincare.",
      'buttonText': "Shop Now",
      'backgroundColor': Colors.pink[50]!,
      'textColor': Colors.pink[800]!,
      'buttonColor': Colors.pink,
      'imageUrl':
          'https://images.unsplash.com/photo-1556228578-8c89e6adf883?w=500&q=80',
      'category': 'Beauty & Health',
    },
    {
      'title': "Power Up Your\nDay with\nInnovation.",
      'buttonText': "Shop Now",
      'backgroundColor': Colors.blue[50]!,
      'textColor': Colors.blue[800]!,
      'buttonColor': Colors.blue,
      'imageUrl':
          'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=500&q=80',
      'category': 'Electronics',
    },
    {
      'title': "Style That\nSpeaks,\nComfort That\nStays",
      'buttonText': "Shop Now",
      'backgroundColor': Colors.purple[50]!,
      'textColor': Colors.purple[800]!,
      'buttonColor': Colors.purple,
      'imageUrl':
          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=500&q=80',
      'category': 'Fashion',
    },
  ];

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

  void _navigateToCategory(String category) {
    setState(() {
      _searchController.text = category;
      _isSearching = true;
      _filteredProducts = _allProducts.where((product) {
        return product.category.toLowerCase().contains(category.toLowerCase());
      }).toList();
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
      return _buildSearchResults();
    } else {
      return _buildBanners();
    }
  }

  Widget _buildBanners() {
    return SingleChildScrollView(
      child: Column(
        children: _banners.map((banner) {
          return Column(
            children: [
              const SizedBox(height: 16),
              _buildBanner(
                title: banner['title'],
                buttonText: banner['buttonText'],
                backgroundColor: banner['backgroundColor'],
                textColor: banner['textColor'],
                buttonColor: banner['buttonColor'],
                imageUrl: banner['imageUrl'],
                category: banner['category'],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBanner({
    required String title,
    required String buttonText,
    required Color backgroundColor,
    required Color textColor,
    required Color buttonColor,
    required String imageUrl,
    required String category,
  }) {
    return GestureDetector(
      onTap: () => _navigateToCategory(category),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: backgroundColor,
                    child: Icon(
                      Icons.shopping_bag,
                      size: 60,
                      color: textColor.withOpacity(0.3),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: backgroundColor,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(textColor),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => _navigateToCategory(category),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: buttonColor.withOpacity(0.4),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              buttonText,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
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
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _clearSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 127, 38, 150),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Text(
              'Clear Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

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
                      Flexible(
                        child: Text(
                          'Rs.${product.discountedPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          'Rs.${product.originalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[500],
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
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
