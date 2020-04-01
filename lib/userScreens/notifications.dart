import 'package:flutter/material.dart';

class UserNotifications extends StatefulWidget {
  @override
  _UserNotificationsState createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Order Notifications"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("My Order Notifications",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );
  }
}
