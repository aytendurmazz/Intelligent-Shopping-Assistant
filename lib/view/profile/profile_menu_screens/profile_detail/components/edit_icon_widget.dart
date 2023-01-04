import 'package:assistant/uiprinciples/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditIconWidget extends StatelessWidget {
  final bool isEdit;
  final VoidCallback onClicked;

  const EditIconWidget({
    Key key,
    this.isEdit = false,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildEditIcon(kPrimaryColor),
      onTap: onClicked,
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            isEdit ? null : Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
