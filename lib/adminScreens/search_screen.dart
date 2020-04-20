import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Search"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Search",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
