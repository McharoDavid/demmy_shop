import 'package:flutter/material.dart';

class AdminProducts extends StatefulWidget {
  @override
  _AdminProductsState createState() => _AdminProductsState();
}

class _AdminProductsState extends State<AdminProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Admin Products"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Admin Products",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
