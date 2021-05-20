import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categorycollection =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference _productcollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    QuerySnapshot value = await _categorycollection.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestProduct() async {
    QuerySnapshot value = await _productcollection.get();

    return value.docs;
  }
}
