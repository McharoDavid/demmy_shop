import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demmyshop/adminScreens/add_products.dart';
import 'package:demmyshop/adminScreens/admin_messages.dart';
import 'package:demmyshop/adminScreens/admin_products.dart';
import 'package:demmyshop/adminScreens/orders_history.dart';
import 'package:demmyshop/adminScreens/profile_settings.dart';
import 'package:demmyshop/adminScreens/search_screen.dart';
import 'package:demmyshop/adminScreens/user_orders.dart';
import 'package:demmyshop/adminScreens/users.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  Size screenSize;

  BuildContext context;
  String accountName = "";
  String accountEmail = "";
  String accountPhotoUrl = "";
  bool isLoggedIn = false;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethods = new FirebaseMethods();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentAdmin();

  }

  Future getCurrentAdmin() async{
//    clearDataLocally();
    accountName = await getStringDataLocally(key: adminFullName);
    accountEmail = await getStringDataLocally(key: adminEmail);

    isLoggedIn = await getBoolDataLocally(key: loggedIn);

    accountName == null ? accountName = "Guest Admin" : accountName;
    accountEmail == null ? accountEmail = "No Email" : accountEmail;

    //print(accountName);

    //print(accountEmail);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text("Admin"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 20.0,),
           new Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> SearchScreen()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.search),
                        new SizedBox(height: 10.0,),
                        new Text("Search"),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> Users()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.person),
                        new SizedBox(height: 10.0,),
                        new Text("Users")
                      ],
                    ),
                  ),
                )

              ],
            ),
            new SizedBox(height: 20.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> UserOrders()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.notifications),
                        new SizedBox(height: 10.0,),
                        new Text("User Orders"),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> AdminMessages(accountEmail4: accountEmail,)));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.chat),
                        new SizedBox(height: 10.0,),
                        new Text("Admin Messages")
                      ],
                    ),
                  ),
                )

              ],
            ),
            new SizedBox(height: 20.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> AdminProducts()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.fastfood),
                        new SizedBox(height: 10.0,),
                        new Text("Admin Products"),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> AddProducts()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.add_circle),
                        new SizedBox(height: 10.0,),
                        new Text("Add Products")
                      ],
                    ),
                  ),
                )

              ],
            ),
            new SizedBox(height: 20.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> OrdersHistory()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.history),
                        new SizedBox(height: 10.0,),
                        new Text("Orders History"),
                      ],
                    ),
                  ),
                ),
                new GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(new CupertinoPageRoute(builder: (context)=> ProfileSettings()));
                  },
                  child: new CircleAvatar(
                    maxRadius: 72.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Icon(Icons.settings),
                        new SizedBox(height: 10.0,),
                        new Text("Profile Settings")
                      ],
                    ),
                  ),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
