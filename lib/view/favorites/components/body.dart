import 'package:assistant/controller/ProductController.dart';
import 'package:assistant/controller/UserController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          .collection('fav')
          .where('isFavourite', isEqualTo: true)
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
                    "Favori Ürünlerim",
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
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
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
                                Text.rich(
                                  TextSpan(
                                    text: "\₺${data['price'].toString()}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: kPrimaryColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        userController.removeFav(docs[i].id.toString());
                        productController.updateProduct(
                            data['pazarName'].toString(),
                            data['standName'].toString(),
                            data['productName'],
                            !data['isFavourite']);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: data['isFavourite']
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: data['isFavourite']
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
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
