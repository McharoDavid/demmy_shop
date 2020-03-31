import 'package:flutter/material.dart';

class UserMessages extends StatefulWidget {
  @override
  _UserMessagesState createState() => _UserMessagesState();
}

class _UserMessagesState extends State<UserMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Messages"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text("My Messages",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );
  }
}
