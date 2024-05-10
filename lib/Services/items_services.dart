import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference item = FirebaseFirestore.instance.collection('Items');

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
