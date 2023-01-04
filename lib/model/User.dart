import 'package:assistant/model/Product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String surname;
  String mail;
  String id;
  String adress;
  List<Product> cart;
  List<Product> favorites;

  DocumentReference reference;
  User(this.name, this.surname, this.mail, this.id, this.adress);

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    User newUser = User.fromJson(snapshot.data());
    newUser.reference = snapshot.reference;
    return newUser;
  }

  @override
  String toString() => "User<$name>";

  User.fromJson(Map<String, dynamic> json) {
    adress = json['adress'];
    mail = json['mail'];
    name = json['name'];
    surname = json['surname'];
    id = json['uID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress'] = this.adress;
    data['mail'] = this.mail;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['uID'] = this.id;
    return data;
  }
}
