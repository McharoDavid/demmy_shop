import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  AppMethods appMethods = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Profile Settings"),
        centerTitle: false,
      ),
      body: Center(
        child: new Text("Profile Settings",
          style: new TextStyle(fontSize: 25.0),),
      ),
      bottomNavigationBar: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appButton(
              btnTxt: "Logout",
              onBtnClicked: adminLogout,
              btnPadding: 20.0,
              btnColor: Theme.of(context).primaryColor
          ),
        ],
      ),
    );

  }

  adminLogout() async {
    displayProgressDialog(context);

    bool isLoggedout = false;

    try{
      await auth.signOut().whenComplete((){
        isLoggedout = true;
      });

    } on PlatformException catch (e){
      print(e.message);
      closeProgressDialog(context);
      showSnackBar(e.message, scaffoldKey);
      return;
    }

    if(isLoggedout == true){
      await clearDataLocally();
      //await showSnackBar("Successfully Logged Out", scaffoldKey);
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();

      setState(() {});

    }



  }

}
