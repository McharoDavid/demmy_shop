import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Demmy Mobile Shop"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.favorite, color: Colors.white,), onPressed: null),
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.chat, color: Colors.white,), onPressed: null),
              new CircleAvatar(
                radius: 9.5,
                backgroundColor: Colors.red,
                child: new Text("0", style: new TextStyle(color: Colors.white, fontSize: 13.0),),
              )
            ],
          )
        ],
      ),

    );
  }
}
