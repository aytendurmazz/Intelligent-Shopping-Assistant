import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/Cart.dart';
import '../model/Product.dart';

class UserController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> userInformation() {
    var list = _firestore
        .collection('users')
        .where('mail', isEqualTo: firebaseAuth.currentUser.email)
        .snapshots();

    return list;
  }

  createCart2(Cart cart, String pazarName, String standName) async {
    var size = 0;
    var id = "";
    await _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .where('pID', isEqualTo: cart.product.id)
        .get()
        .then((_) async {
      id = _.docs.first.id.toString();
      size = _.size;
      print(id.toString());
    }).catchError((_) {
      print("DAHA URUN YOK");
    });

    if (size == 0) {
      _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser.uid)
          .collection("cart")
          .add({
        "isFavourite": cart.product.isFavourite,
        "pDescription": cart.product.description,
        "pID": cart.product.id,
        "pImage": cart.product.images,
        "pTitle": cart.product.title,
        "price": cart.product.price,
        "number": cart.numOfItem,
        'pazarName': pazarName,
        'standName': standName,
      }).then((_) {
        print("collection created");
      }).catchError((_) {
        print("Hata Yakalandı");
      });
    } else {
      print("Gelen dokument id");
      print(id);
      await _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser.uid)
          .collection("cart")
          .doc(id)
          .update({'number': FieldValue.increment(1)}).then((_) {
        print("Update");
      }).catchError((_) {
        print("Hata Yakalandı");
      });
    }
  }

  createCart(Cart cart) {
    _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .add({
      "isFavourite": cart.product.isFavourite,
      "pDescription": cart.product.description,
      "pID": cart.product.id,
      "pImage": cart.product.images,
      "pTitle": cart.product.title,
      "price": cart.product.price,
      "number": cart.numOfItem,
    }).then((_) {
      print("collection created");
    }).catchError((_) {
      print("Hata Yakalandı");
    });
  }

  createFavList(Product product, bool bool, String pazarName, String standName,
      String productName) async {
    var size = 0;
    print(bool);
    var id = "";
    await _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("fav")
        .where('pID', isEqualTo: product.id)
        .get()
        .then((_) async {
      id = _.docs.first.id.toString();
      size = _.size;
      print(id.toString());
    }).catchError((_) {
      print("DAHA URUN YOK");
    });

    if (size == 0) {
      _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser.uid)
          .collection("fav")
          .add({
        "isFavourite": product.isFavourite,
        "pDescription": product.description,
        "pID": product.id,
        "pImage": product.images,
        "pTitle": product.title,
        "price": product.price,
        "pazarName": pazarName,
        "standName": standName,
        "productName": productName,
      }).then((_) {
        print("collection created");
      }).catchError((_) {
        print("an error occured");
      });
    } else {
      print("Gelen dokument id");
      print(id);
      await _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser.uid)
          .collection("fav")
          .doc(id)
          .update({'isFavourite': bool}).then((_) {
        print("Update");
      }).catchError((_) {
        print("Hata Yakalandı");
      });
    }
  }

  removeFav(String id) {
    _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("fav")
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
  }

    createOrder(Product product) {
      _firestore
          .collection("users")
          .doc(firebaseAuth.currentUser.uid)
          .collection("order")
          .add({
        "pTitle": product.title,
        'price': product.price * product.number,
        'pImage': product.images,
        'pazarName': product.pazarName,
        'standName': product.standName,
        "time": DateTime.now(),
      }).then((_) {
        print("collection created");
      }).catchError((_) {
        print("Hata Yakalandı");
      });
    }

  clearCart() async {
    var collection = _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart");
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  removeProduct(String id) {
    _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .collection("cart")
        .doc(id) // <-- Doc ID to be deleted.
        .delete() // <-- Delete
        .then((_) => print('Deleted'))
        .catchError((error) => print('Delete failed: $error'));
  }

  userUpdateInformation(String name, String surname, String mail,
      String telephoneNumber, String adress) async {
    await _firestore
        .collection("users")
        .doc(firebaseAuth.currentUser.uid)
        .update({
      'adress': adress,
      'name': name,
      'surname': surname,
      'telephoneNumber': telephoneNumber,
      'mail': mail
    }).then((_) {
      print("Update");
    }).catchError((_) {
      print("Hata Yakalandı");
    });
  }

  /*userInformation() async {
    var list = await _firestore
        .collection('users')
        .where('mail', isEqualTo: firebaseAuth.currentUser.email);

    QuerySnapshot querySnapshot = await list.get();
    final allData = querySnapshot.docs.map((e) => e.data()).toList();
    print(allData);
    return allData;
  }*/

}
