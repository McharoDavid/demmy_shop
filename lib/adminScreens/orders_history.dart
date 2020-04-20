import 'package:flutter/material.dart';

class OrdersHistory extends StatefulWidget {
  @override
  _OrdersHistoryState createState() => _OrdersHistoryState();
}

class _OrdersHistoryState extends State<OrdersHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Orders History"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Orders History",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
