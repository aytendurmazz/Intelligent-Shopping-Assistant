import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../sign_in/sign_in_screen.dart';

class EcommerceMenu extends StatelessWidget {
  const EcommerceMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 5,
              color: const Color.fromARGB(255, 54, 171, 244),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_cart),
                  Text(
                    "ALIŞVERİŞ",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/shoppingc.png',
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: const [
                  Icon(Icons.location_pin),
                  Expanded(
                      child: Text(
                    "Şu an bulunduğunuz bölgeye sipariş verebilirsiniz",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ))
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.green.shade900,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(35))),
                height: 40,
                child: TextButton(
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      'Market Siparişi Ver',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
