import 'package:assistant/controller/UserController.dart';
import 'package:assistant/view/profile/component/profile_pic.dart';
import 'package:assistant/view/profile/profile_menu_screens/profile_detail/profile_detail_edit_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/edit_icon_widget.dart';
import 'components/editablefield_widget.dart';

class ProfileDetailBody extends StatelessWidget {
  ProfileDetailBody({
    Key key,
  }) : super(key: key);

  UserController userController = UserController();

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: userController.userInformation(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');
        if (snapshot.hasData) {
          final docs = snapshot.data.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (_, i) {
              var data = docs[i].data();
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    ProfilePic(),
                    const SizedBox(height: 20),
                    const SizedBox(height: 24),
                    EditableField("Name and Surname :",
                        data['name'] + " " + data['surname'], context),
                    const SizedBox(height: 24),
                    EditableField("Email:", data['mail'], context),
                    const SizedBox(height: 24),
                    EditableField("Adress:", data['adress'], context),
                    const SizedBox(height: 24),
                    EditableField(
                        "Phone Number:", data['telephoneNumber'], context),
                    Container(
                      child: EditIconWidget(
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ProfileDetailEditScreen(
                                      userN: data['name'],
                                      userSN: data['surname'],
                                      email: data['mail'],
                                      address: data['adress'],
                                      pNumber: data['telephoneNumber'],
                                    )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
