import 'package:assistant/view/pazar/components/stand_banner.dart';
import 'package:flutter/material.dart';

import '../../../components/home_header.dart';
import '../../../model/Pazar.dart';
import '../../../uiprinciples/size_config.dart';

class Body extends StatelessWidget {
  final Pazar pazar;
  final String pNumber;

  const Body({Key key, this.pazar, this.pNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            StandBanner(
              pNumber: pNumber,
            ),
          ],
        ),
      ),
    );
  }
}
