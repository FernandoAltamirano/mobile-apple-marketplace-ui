class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final List<String> images;
  final double discountPercentage;
  final double rating;
  final List<String> colors;
  final List<String> memorySize;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.images,
    required this.discountPercentage,
    required this.rating,
    required this.colors,
    required this.memorySize,
  });

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toDouble(),
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
        discountPercentage: json["discount_percentage"].toDouble(),
        rating: json["rating"].toDouble(),
        colors: List<String>.from(json["colors"].map((x) => x)),
        memorySize: List<String>.from(json["memory_size"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
        "discount_percentage": discountPercentage,
        "rating": rating,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "memory_size": List<dynamic>.from(memorySize.map((x) => x)),
      };
}
