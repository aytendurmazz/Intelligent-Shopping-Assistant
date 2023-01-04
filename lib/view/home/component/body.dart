import 'package:assistant/view/home/component/pazar.dart';
import 'package:flutter/material.dart';

import '../../../components/home_header.dart';
import 'pazar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            //SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            //SizedBox(height: getProportionateScreenWidth(20)),

            PazarBanner(),
          ],
        ),
      ),
    );
  }
}
