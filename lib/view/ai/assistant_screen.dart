import 'package:assistant/camera_config/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssistantOptions extends StatelessWidget {
  const AssistantOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.teal,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
              child: Text(
                "Selam\nSize Nasıl yardımcı olabilirim?",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/assistant.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
              child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        color: Colors.blue,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  height: 70,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text(
                            'Ürün hakkında bilgi ver',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StaticImage(),
                              ),
                            );
                          },
                        ),
                      ),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
            ),
          ],
        ));
  }
}
