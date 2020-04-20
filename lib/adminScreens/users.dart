import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Users"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Users",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
