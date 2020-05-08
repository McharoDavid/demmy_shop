import 'package:flutter/material.dart';

import '../main.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("About Us"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            child: GestureDetector(
              onDoubleTap: (){
                Navigator.of(context).
                push(new MaterialPageRoute(builder: (BuildContext context) => new SplashScreen()));
              },
                child: Image.asset('assets/images/ForeignSnacksLogo.png')
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("About Us:",
            style: TextStyle(fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0, right: 5.0),
            child: Text("Foreign Snacks is a great company with a great culture. We value our customers needs and wants.",
              style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0, right: 5.0),
            child: Text("Started as an idea of a single person called Gladys Mcharo, then the idea was implemented by husband David Mcharo.",
              style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0, right: 5.0),
            child: Text("Right now Foreign Snacks is serving 2.5 million people in north america and planning to expand to south america.",
              style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Vision:",
            style: TextStyle(fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0, right: 5.0),
            child: Text("Foreign Snacks' mission and vision is to serve everyone in the whole world by delivering snacks to your door step.",
              style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text("Slogan:",
            style: TextStyle(fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left:5.0, right: 5.0),
            child: Text("\"Foreign Snacks at your door step.\"",
              style: TextStyle(fontSize: 18.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.blue
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text("@copyright 2020 FOREIGN SNACKS LLC",
            style: TextStyle(fontSize: 15.0,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                color: Colors.black
            ),
            textAlign: TextAlign.center,
          ),


        ],
      ),
    );

  }
}
