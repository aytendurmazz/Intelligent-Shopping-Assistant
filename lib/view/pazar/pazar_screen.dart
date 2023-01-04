import 'package:assistant/view/pazar/components/body.dart';
import 'package:flutter/material.dart';

import '../../model/Pazar.dart';

class PazarScreen extends StatelessWidget {
  static String routeName = "/pazar";

  @override
  Widget build(BuildContext context) {
    final PazarArguments agrs =
        ModalRoute.of(context).settings.arguments as PazarArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(
        pazar: agrs.pazar,
        pNumber: agrs.pNumber,
      ),
    );
  }
}

class PazarArguments {
  final Pazar pazar;
  final String pNumber;

  PazarArguments({this.pazar, this.pNumber});
}
