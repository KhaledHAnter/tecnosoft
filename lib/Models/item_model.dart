class ItemModel {
  final String name, desc, gender;
  final int id;
  final double price;
  final List<dynamic> images;
  final List<dynamic> sizes;

  ItemModel({
    required this.name,
    required this.desc,
    required this.price,
    required this.sizes,
    required this.images,
    required this.gender,
    required this.id,
  });

  factory ItemModel.fromJson(jsonData) {
    return ItemModel(
      id: jsonData['id'],
      name: jsonData['name'],
      desc: jsonData['desc'],
      price: jsonData['price'],
      sizes: jsonData['sizes'],
      images: jsonData['images'],
      gender: jsonData['gender'],

    );
  }
}
