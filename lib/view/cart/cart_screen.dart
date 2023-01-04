import 'package:assistant/view/cart/components/check_out_card.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}
