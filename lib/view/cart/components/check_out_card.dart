import 'package:assistant/controller/UserController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/default_button.dart';
import '../../../model/Product.dart';
import '../../../uiprinciples/size_config.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  UserController userController = UserController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('cart')
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) return Text('Something went wrong');
        if (snapshot.connectionState == ConnectionState.waiting)
          return CircularProgressIndicator();
        List<Product> productList = [];
        var total = 0;
        snapshot.data.docs.forEach((result) {
          total += result.data()['price'] * result.data()['number'];

          productList.add(Product(
              number: result.data()['number'],
              price: result.data()['price'],
              title: result.data()['pTitle'],
              images: result.data()['pImage'],
              pazarName: result.data()['pazarName'],
              standName: result.data()['standName']));
        });

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(15),
            horizontal: getProportionateScreenWidth(30),
          ),
          // height: 174,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15),
              )
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Toplam:\n",
                        children: [
                          TextSpan(
                            text: (total).toStringAsFixed(2),
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: DefaultButton(
                        text: "Sipariş Ver",
                        press: () {
                          Fluttertoast.showToast(
                              msg: "Siparişiniz Alındı ✓",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 20.0);
                          productList.forEach((element) {
                            userController.createOrder(element);
                          });
                          Navigator.pop(context);
                          userController.clearCart();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
