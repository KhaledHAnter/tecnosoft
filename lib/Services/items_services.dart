import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tecnosoft_task/Models/item_model.dart';

CollectionReference item = FirebaseFirestore.instance.collection('Items');
CollectionReference cart = FirebaseFirestore.instance.collection('Cart');

Future<void> addItem({
  required int id,
  required String name,
  required String desc,
  required double price,
  required List<int> sizes,
  required List<String> images,
  required String gender,
}) {
  return item
      .add({
        'id': id,
        'name': name,
        'desc': desc,
        'price': price,
        'sizes': sizes,
        'images': images,
        'gender': gender,
      })
      .then((value) => print("Item Added"))
      .catchError((error) => print("Failed to add item: $error"));
}
Future<void> addToCart({
  required int id,
  required double price,
  required int quantity,
  required dynamic size,
}) {
  return cart
      .add({
        'id': id,
        'price': price,
        'quantity': quantity,
        'size': size
      })
      .then((value) => print("Item Added to cart"))
      .catchError((error) => print("Failed to add item to cart: $error"));
}

List<ItemModel> productsData = [];

getProdustsData() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection("Items").orderBy('id').get();

  for (int i = 0; i < querySnapshot.docs.length; i++) {
     productsData.add(ItemModel.fromJson(querySnapshot.docs[i].data()));
  }
  List<ItemModel> fuckData = productsData;
  return fuckData;
}
