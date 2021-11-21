class Product {
  final int id;
  final price;
  final String title;
  final String description;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image});
  factory Product.fromJson(json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
    );
  }
}
