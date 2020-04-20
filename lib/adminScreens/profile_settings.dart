import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Profile Settings"),
        centerTitle: false,
      ),
      body: new Center(
        child: new Text("Profile Settings",
          style: new TextStyle(fontSize: 25.0),),
      ),
    );

  }
}
