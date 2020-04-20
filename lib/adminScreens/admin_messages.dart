import 'package:flutter/material.dart';

class AdminMessages extends StatefulWidget {
  @override
  _AdminMessagesState createState() => _AdminMessagesState();
}

class _AdminMessagesState extends State<AdminMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Admin Messages"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Admin Messages",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
