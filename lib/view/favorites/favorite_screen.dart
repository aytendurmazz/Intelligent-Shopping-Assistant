import 'package:assistant/view/favorites/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../uiprinciples/enums.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorites";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
