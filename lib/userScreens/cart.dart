import 'package:flutter/material.dart';

class UserCart extends StatefulWidget {
  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Cart"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("My Cart",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );
  }
}
