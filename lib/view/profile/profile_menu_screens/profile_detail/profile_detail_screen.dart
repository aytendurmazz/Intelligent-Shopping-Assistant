import 'package:assistant/controller/UserController.dart';
import 'package:assistant/view/profile/profile_menu_screens/profile_detail/profile_detail_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  ProfileDetail({
    Key key,
    this.iseditpage,
  }) : super(key: key);
  bool iseditpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ProfileDetailBody(),
    );
  }

/* ERHAN SENİN YAZDIĞIN KISIM
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: userController.userInformation(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData) {
            final docs = snapshot.data.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                var data = docs[i].data();
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Text(
                      data['name'].toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }*/

}
