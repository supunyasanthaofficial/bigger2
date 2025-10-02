class Product {
  final String id;
  final String name;
  final String image;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final bool isHot;
  final bool isNew;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    this.isHot = false,
    this.isNew = false,
    required this.category,
    required this.description,
  });

  double get discountPercentage {
    return ((originalPrice - discountedPrice) / originalPrice * 100)
        .roundToDouble();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
      'rating': rating,
      'isHot': isHot,
      'isNew': isNew,
      'category': category,
      'description': description,
      'discountPercentage': discountPercentage,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      originalPrice: (map['originalPrice'] ?? 0.0).toDouble(),
      discountedPrice: (map['discountedPrice'] ?? 0.0).toDouble(),
      rating: (map['rating'] ?? 0.0).toDouble(),
      isHot: map['isHot'] ?? false,
      isNew: map['isNew'] ?? false,
      category: map['category'] ?? '',
      description: map['description'] ?? '',
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? image,
    double? originalPrice,
    double? discountedPrice,
    double? rating,
    bool? isHot,
    bool? isNew,
    String? category,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      rating: rating ?? this.rating,
      isHot: isHot ?? this.isHot,
      isNew: isNew ?? this.isNew,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
