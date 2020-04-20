//import 'package:flutter/material.dart';
//import 'userScreens/myHomePage.dart';
import 'dart:io';

import 'package:demmyshop/userScreens/myHomePage.dart';
import 'package:flutter/material.dart';


void main() {
  //HttpOverrides.global = _HttpOverrides();
  runApp(MyApp());
}

//class _HttpOverrides extends HttpOverrides {
//  @override
//  HttpClient createHttpClient(SecurityContext context) {
//    final HttpClient client = super.createHttpClient(context);
//    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//    return client;
//  }
//}
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

