class CartModel {
  int id, quantity;
  final double price;
  final int size;

  CartModel(
      {required this.price,
      required this.size,
      required this.id,
      required this.quantity});

  factory CartModel.fromJson(jsonData) {
    return CartModel(
      id: jsonData['id'],
      price: jsonData['price'],
      size: jsonData['size'],
      quantity: jsonData['quantity'],
    );
  }
}
