import 'package:assistant/controller/UserController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../uiprinciples/constant.dart';
import '../../../uiprinciples/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserController userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: _showCart(),
    );
  }

  Widget _showCart() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('cart')
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
                    "Sepetim",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "${docs.length} ürün",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            body: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                final data = docs[i].data();
                return Column(
                  children: [
                    Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          userController.removeProduct(docs[i].id);
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              SvgPicture.asset("assets/icons/Trash.svg"),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(10)),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:
                                      Image.network(data['pImage'].toString()),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['pTitle'].toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16),
                                  maxLines: 2,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: "\₺${data['price'].toString()}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: " x${data['number'].toString()}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                );
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
