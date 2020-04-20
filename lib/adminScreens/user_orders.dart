import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("User Orders"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("User Orders",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
