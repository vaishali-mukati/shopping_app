class ProductModel {
  final int id;
  final String title;
  final String brand;
  final double price;
  final double discountPercentage;
  final String thumbnail;
  int quantity; // Used for cart

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.discountPercentage,
    required this.thumbnail,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      brand: json['brand'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  double get discountedPrice {
    return price - (price * discountPercentage / 100);
  }
}