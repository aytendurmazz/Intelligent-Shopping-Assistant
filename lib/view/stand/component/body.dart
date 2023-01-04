import 'package:assistant/view/stand/component/product_banner.dart';
import 'package:flutter/material.dart';

import '../../../components/Collections.dart';
import '../../../components/home_header.dart';
import '../../../model/Stand.dart';
import '../../../uiprinciples/size_config.dart';

class Body extends StatelessWidget {
  final Stand stand;
  final String sNumber;
  final String pazarName;

  const Body({Key key, this.stand, this.sNumber, this.pazarName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            const HomeHeader(),
            Collections(),
            ProductBanner(
              sNumber: sNumber,
              pazarName: pazarName,
            ),
          ],
        ),
      ),
    );
  }
}
