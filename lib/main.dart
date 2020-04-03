import 'package:flutter/material.dart';
import 'userScreens/myHomePage.dart';

void main() {
  runApp(MyApp());
}
/*
To get sign in certificate for connecting to firebase:
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
*/


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Foreign Snacks',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

