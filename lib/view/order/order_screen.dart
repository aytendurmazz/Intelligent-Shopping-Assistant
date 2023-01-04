import 'package:assistant/view/order/components/body.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = "/order";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
