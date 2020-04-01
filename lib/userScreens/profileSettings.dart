import 'package:flutter/material.dart';

class UserProfileSettings extends StatefulWidget {
  @override
  _UserProfileSettingsState createState() => _UserProfileSettingsState();
}

class _UserProfileSettingsState extends State<UserProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile Settings"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("My Profile Settings",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
