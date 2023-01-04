import 'package:assistant/uiprinciples/enums.dart';
import 'package:assistant/view/home/component/body.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
