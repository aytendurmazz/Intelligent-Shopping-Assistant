import 'package:assistant/view/stand/component/body.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../model/Stand.dart';
import '../../uiprinciples/enums.dart';

class StandScreen extends StatelessWidget {
  static String routeName = "/stand";

  @override
  Widget build(BuildContext context) {
    final StandArguments agrs =
        ModalRoute.of(context).settings.arguments as StandArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body: Body(
        stand: agrs.stand,
        sNumber: agrs.sName,
        pazarName: agrs.pazarName,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}

class StandArguments {
  final Stand stand;
  final String sName;
  final String pazarName;

  StandArguments({this.stand, this.sName, this.pazarName});
}
