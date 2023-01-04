import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  updateCart(int id) async {
    var docID = await NumberOfCardDocId(id);
    print("Gelen dokument id");
    print(docID);

    await _firestore
        .collection("users")
        .doc(_auth.currentUser.uid)
        .collection("cart")
        .doc(docID)
        .update({'number': FieldValue.increment(1)}).then((_) {
      print("Update");
    }).catchError((_) {
      print("Hata Yakalandı");
    });
  }

  NumberOfCard(int id) async {
    var size = 0;
    await _firestore
        .collection("users")
        .doc(_auth.currentUser.uid)
        .collection("cart")
        .where('pID', isEqualTo: id)
        .get()
        .then((_) {
      size = _.size;
      print(size);
    }).catchError((_) {
      print("ID Yok");
    });
    return size;
  }

  Future<String> NumberOfCardDocId(int id) async {
    await _firestore
        .collection("users")
        .doc(_auth.currentUser.uid)
        .collection("cart")
        .where('pID', isEqualTo: id)
        .get()
        .then((_) async {
      var id = _.docs.first.id.toString();
      print(id.toString());
      return id;
    }).catchError((_) {
      print("DAHA URUN YOK");
    });
  }
}
