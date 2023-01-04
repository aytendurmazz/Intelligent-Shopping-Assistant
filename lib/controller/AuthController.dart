import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User> logIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  signOut() async {
    print("çıktın");
    return await _auth.signOut();
  }

  Future<User> createUser(String mail, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: mail, password: password);

    await _firestore.collection("users").doc(user.user.uid).set({'mail': mail});

    return user.user;
  }

  setInformation(String name, String surname, String telephoneNumber,
      String adress) async {
    await _firestore.collection("users").doc(_auth.currentUser.uid).update({
      'name': name,
      'surname': surname,
      'telephoneNumber': telephoneNumber,
      'adress': adress
    });
  }
}
