import 'package:assistant/view/ai/ai_asisstant_menu_screen.dart';
import 'package:assistant/view/ecommerce/ecommerce_menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainWidgets extends StatelessWidget {
  static String routeName = "/selection";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              children: const [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: EcommerceMenu())),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
                        child: AssistanMenu())),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
