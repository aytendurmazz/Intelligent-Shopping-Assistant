import 'package:assistant/uiprinciples/routes.dart';
import 'package:assistant/uiprinciples/theme.dart';
import 'package:assistant/view/selection_menu/main_screen.dart';
import 'package:assistant/view/splash/splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(MaterialApp(
    //home: Login(),
    theme: theme(),
    debugShowCheckedModeBanner: false,
    initialRoute: SplashScreen.routeName,
    routes: routes,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Center(
          child: Text(
            "Yapay zeka asistanını kullanabilir veya sipariş verebilirsiniz",
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ),
        Expanded(child: MainWidgets()),
      ],
    ));
  }
}
