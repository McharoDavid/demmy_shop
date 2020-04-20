//import 'package:flutter/material.dart';
//import 'userScreens/myHomePage.dart';
import 'dart:async';
import 'dart:io';

import 'package:demmyshop/userScreens/myHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
      home: SplashScreen(), //MyHomePage()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), ()=>     Navigator.of(context).
    push(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePage())));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          new Container(
            decoration: BoxDecoration(color: Colors.white70),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Expanded(
                flex: 2,
                child: new Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Image.asset('assets/images/ForeignSnacksLogo.png'),
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    new SizedBox(
                      height: 30.0,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 20.0,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Online Mobile Store \n For Buying Snacks",
                        style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}


