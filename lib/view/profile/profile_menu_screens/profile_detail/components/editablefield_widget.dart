import 'package:assistant/uiprinciples/size_config.dart';
import 'package:flutter/material.dart';

import 'edit_icon_widget.dart';

bool iseditpage = false;

Widget EditableField(String fieldName, String Var, BuildContext context) {
  return Column(children: [
    Text(
      fieldName,
      style: TextStyle(color: Colors.black87, fontSize: 15),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: getProportionateScreenWidth(350),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(21, 0, 0, 0),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            Var,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 4),
  ]);
}
