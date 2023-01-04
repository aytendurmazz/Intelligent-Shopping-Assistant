import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*fetchData(String stand) async {
    var list = await _firestore
        .collection('pazarlar')
        .doc('özkanlarmeyvesebze')
        .collection('stands')
        .doc(stand)
        .collection('products');

    QuerySnapshot querySnapshot = await list.get();
    final allData = querySnapshot.docs.map((e) => e.data()).toList();
    return allData;
  }*/

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream(
      String pazar, String stand) {
    var list = _firestore
        .collection('pazarlar')
        .doc(pazar)
        .collection('stands')
        .doc(stand)
        .collection('products')
        .snapshots();
    return list;
  }

  updateProduct(String pazar, String stand, String product, bool durum) async {
    await _firestore
        .collection("pazarlar")
        .doc(pazar)
        .collection('stands')
        .doc(stand)
        .collection('products')
        .doc(product)
        .update({
      'isFavourite': durum,
    });
  }

  updateProductRate(
      String pazar, String stand, String product, double rate) async {
    await _firestore
        .collection("pazarlar")
        .doc(pazar)
        .collection('stands')
        .doc(stand)
        .collection('products')
        .doc(product)
        .update({
      'productRate': FieldValue.increment(rate),
      'voteCounter': FieldValue.increment(1)
    });
  }
}
