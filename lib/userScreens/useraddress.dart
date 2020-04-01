import 'package:flutter/material.dart';

class UserAddress extends StatefulWidget {
  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Delivery Adreess"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("My Delivery Address",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
