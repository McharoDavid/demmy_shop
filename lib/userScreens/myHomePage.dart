import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'favorites.dart';
import 'messages.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Foreign Snacks"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.favorite, color: Colors.white,),
              onPressed: (){
                Navigator.of(context)
                    .push(new CupertinoPageRoute(builder: (BuildContext context) {
                      return new UserFavorites();
                }));
              }),
          new Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.chat, color: Colors.white,),
                  onPressed: (){
                    Navigator.of(context).
                    push(new CupertinoPageRoute(builder: (BuildContext context) => new UserMessages()));
                  }),
              new CircleAvatar(
                radius: 9.5,
                backgroundColor: Colors.red,
                child: new Text("0", style: new TextStyle(color: Colors.white, fontSize: 13.0),),
              )
            ],
          )
        ],
      ),
      body: new Center(
        child: new Text("My Homepage Store", style: new TextStyle(fontSize: 20.0),),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(onPressed: null,
              child: new Icon(Icons.shopping_cart)),
          new CircleAvatar(
            radius: 9.5,
            backgroundColor: Colors.red,
            child: new Text("0", style: new TextStyle(color: Colors.white, fontSize: 13.0),),
          )
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("David Mcharo"),
                accountEmail: new Text("davidamcharo@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.person),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order Notifications"),
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order History"),
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Profile Settings"),
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Delivery Address"),
            ),
            new Divider(),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("About Us"),
            ),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Login"),
            ),
          ],
        ),
      ),


    );
  }
}
