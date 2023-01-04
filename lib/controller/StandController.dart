import 'package:cloud_firestore/cloud_firestore.dart';

class StandController {
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getStream(String pazar) {
    var list = _firestore
        .collection('pazarlar')
        .doc(pazar)
        .collection('stands')
        .snapshots();
    return list;
  }

  updateStandRate(String pazar, String stand, double rate) async {
    await _firestore
        .collection("pazarlar")
        .doc(pazar)
        .collection('stands')
        .doc(stand)
        .update({
      'standRate': rate,
    });
  }
}
