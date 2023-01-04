import 'package:assistant/controller/ProductController.dart';
import 'package:assistant/controller/UserController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../uiprinciples/constant.dart';
import '../../../uiprinciples/size_config.dart';

class Body extends StatelessWidget {
  UserController userController = UserController();
  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('order')
          .orderBy("time")
          .snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          final docs = snapshot.data.docs;
          return Scaffold(
            appBar: AppBar(
              title: Column(
                children: [
                  const Text(
                    "Geçmiş Siparişlerim",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "${docs.length} ürün",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(4.0),
                          width: 200.0,
                          child: const Text(
                            "Satın Alma Bilgileri",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )),
                      Container(
                          padding: EdgeInsets.all(4.0),
                          child: const Text(
                            "Ürün Bilgileri",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (_, i) {
                      final data = docs[i].data();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: AspectRatio(
                                      aspectRatio: 0.88,
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            getProportionateScreenWidth(10)),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF5F6F9),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Image.network(
                                            data['pImage'].toString()),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['standName'].toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['pazarName'].toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['time'].toDate().toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    color: Colors.black,
                                    height: 50,
                                    width: 2,
                                  ),
                                  const SizedBox(width: 5),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['pTitle'].toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            maxLines: 2,
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              text:
                                                  "\₺${data['price'].toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: kPrimaryColor),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
