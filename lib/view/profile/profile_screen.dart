import 'package:flutter/material.dart';

import 'component/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}
