import 'package:assistant/uiprinciples/size_config.dart';
import 'package:assistant/view/pazar/pazar_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../components/pazar_card.dart';
import '../../../components/section_tile.dart';
import '../../../model/Pazar.dart';

class PazarBanner extends StatelessWidget {
  const PazarBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SectionTitle(title: "Pazarlar", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenWidth(
                    500), // <-- you should put some value here
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('pazarlar')
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');
                    if (snapshot.hasData) {
                      final docs = snapshot.data.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (_, i) {
                          final data = docs[i].data();

                          Pazar p1 = Pazar(
                              id: data['id'],
                              day: data['day'],
                              image: data['image'],
                              title: data['name']);

                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PazarScreen.routeName,
                                  arguments: PazarArguments(
                                      pazar: p1,
                                      pNumber: docs[i].id.toString()),
                                );
                              },
                              child: PazarCard(
                                pazar: p1,
                              ));
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
