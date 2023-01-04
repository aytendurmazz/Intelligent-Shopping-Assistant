import 'package:assistant/components/stand_card.dart';
import 'package:assistant/controller/StandController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../components/section_tile.dart';
import '../../../model/Stand.dart';
import '../../../uiprinciples/size_config.dart';
import '../../stand/stand_screen.dart';

class StandBanner extends StatelessWidget {
  StandController standController = StandController();
  final String pNumber;
  StandBanner({
    Key key,
    this.pNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SectionTitle(title: "Standlar", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(40)),
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
                  stream: standController.getStream(pNumber),
                  builder: (_, snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');
                    if (snapshot.hasData) {
                      final docs = snapshot.data.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (_, i) {
                          final data = docs[i].data();

                          Stand s1 = Stand(
                              id: data['sID'],
                              image: data['sImage'],
                              title: data['sTitle'],
                              standRate: data['standRate']);

                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  StandScreen.routeName,
                                  arguments: StandArguments(
                                      stand: s1,
                                      sName: docs[i].id.toString(),
                                      pazarName: pNumber),
                                );
                              },
                              child: StandCard(
                                stand: s1,
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
