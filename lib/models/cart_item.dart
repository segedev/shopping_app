class CartItem{
  final String id;
  final String title;
  final String img;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.img,
    required this.price,
    required this.quantity,
  });

  double get totalPrice {
    return price * quantity;
  }
}