import 'package:assistant/components/default_button.dart';
import 'package:assistant/view/profile/profile_menu_screens/profile_detail/profile_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../controller/UserController.dart';

class ProfileDetailEditScreen extends StatefulWidget {
  String userN;
  String userSN;
  String email;
  String address;
  String pNumber;

  ProfileDetailEditScreen(
      {Key key,
      this.userN,
      this.userSN,
      this.email,
      this.address,
      this.pNumber})
      : super(key: key);

  @override
  _ProfileDetailEditState createState() => _ProfileDetailEditState();
}

class _ProfileDetailEditState extends State<ProfileDetailEditScreen> {
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/147/147142.png"),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                widget.userN = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: widget.userN,
                  labelText: 'Name',
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  prefixText: ' ',
                  suffixStyle: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 24),
            TextField(
              onChanged: (value) {
                widget.userSN = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: widget.userSN,
                  labelText: 'Surname',
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  prefixText: ' ',
                  suffixStyle: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 24),
            TextField(
              onChanged: (value) {
                widget.email = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: widget.email,
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.blue,
                  ),
                  prefixText: ' ',
                  suffixStyle: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 24),
            TextField(
              onChanged: (value) {
                widget.address = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: widget.address,
                  labelText: 'Adress',
                  prefixIcon: Icon(
                    Icons.location_pin,
                    color: Colors.blue,
                  ),
                  prefixText: ' ',
                  suffixStyle: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 24),
            TextField(
              onChanged: (value) {
                widget.pNumber = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: widget.pNumber,
                  labelText: 'Phone Number',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  prefixText: ' ',
                  suffixStyle: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 24),
            DefaultButton(
                text: "Save",
                press: () {
                  userController.userUpdateInformation(
                      widget.userN,
                      widget.userSN,
                      widget.email,
                      widget.pNumber,
                      widget.address);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileDetail()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
