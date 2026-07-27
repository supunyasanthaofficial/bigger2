class Category {
  final String id;
  final String name;
  final String icon;
  final int itemCount;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.itemCount,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'icon': icon, 'item_count': itemCount};
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      icon: map['icon'] ?? '',
      itemCount: map['item_count'] ?? 0,
    );
  }
}
