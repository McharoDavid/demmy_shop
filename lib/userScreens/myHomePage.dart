import 'package:demmyshop/tools/store.dart';
import 'package:demmyshop/userScreens/itemDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'favorites.dart';
import 'messages.dart';
import 'cart.dart';
import 'notifications.dart';
import 'history.dart';
import 'profileSettings.dart';
import 'useraddress.dart';
import 'aboutus.dart';
import 'loginLogout.dart';

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
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new GridView.builder(gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: storeItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: (){
                        Navigator.of(context).
                        push(new MaterialPageRoute(
                            builder: (context)=> new ItemDetails(
                              itemName: storeItems[index].itemName,
                              itemPrice: storeItems[index].itemPrice,
                              itemImage: storeItems[index].itemImage,
                              itemRating: storeItems[index].itemRating,
                            )
                        ));
                      },
                      child: Card(
                        child: Stack(
                          alignment: FractionalOffset.topLeft,
                          children: <Widget>[
                            new Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[
                                new Container(
                                  decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                      //fit: BoxFit.fitWidth,
                                        image: new NetworkImage(storeItems[index].itemImage)
                                    ),
                                  ),

                                ),
                                new Container(
                                  height: 33.0,
                                  color: Colors.black.withAlpha(90),
                                  child: new Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Text("${storeItems[index].itemName.substring(0,4)}...",
                                          style: new TextStyle(
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Colors.white),),
                                        new Text("\$${storeItems[index].itemPrice}",
                                          style: new TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w700),),

                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                  height: 30.0,
                                  width: 50.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: new BorderRadius.only(
                                          topRight: new Radius.circular(5.0),
                                          bottomRight: new Radius.circular(5.0)
                                      )
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new Icon(
                                        Icons.star,
                                        color: Colors.blueGrey,
                                        size: 20.0,
                                      ),
                                      new Text(
                                        "${storeItems[index].itemRating}",
                                        style: new TextStyle(color: Colors.blueGrey),
                                      )
                                    ],
                                  ),
                                ),
                                new IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.lightBlueAccent,
                                    ),
                                    onPressed: (){}
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                    )
            )
          ],
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(onPressed: (){
            Navigator.of(context).
            push(new CupertinoPageRoute(builder: (BuildContext context) => new UserCart()));
          },
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
            new ListTile (
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order Notifications"),
              onTap: (){
                Navigator.of(context).
                push(new CupertinoPageRoute(builder: (BuildContext context) => new UserNotifications()));
              },
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
              onTap: (){
                Navigator.of(context).
                push(new CupertinoPageRoute(builder: (BuildContext context) => new UserHistory()));
              },
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
              onTap: (){
                Navigator.of(context).
                push(new CupertinoPageRoute(builder: (BuildContext context) => new UserProfileSettings()));
              },
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
              onTap: (){
                Navigator.of(context).
                push(new CupertinoPageRoute(builder: (BuildContext context) => new UserAddress()));
              },
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
              onTap: (){
                Navigator.of(context).
                push(new CupertinoPageRoute(builder: (BuildContext context) => new AboutUs()));
              },
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
              onTap: (){
                Navigator.of(context).
                push(new CupertinoPageRoute(builder: (BuildContext context) => new Login()));
              },
            ),
          ],
        ),
      ),


    );
  }
}
