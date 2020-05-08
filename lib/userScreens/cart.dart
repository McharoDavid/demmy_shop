import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCart extends StatefulWidget {
  final String accountEmail22;
  UserCart({this.accountEmail22});

  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends State<UserCart> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  Firestore firestore = Firestore.instance;
  Size screenSize;
  double totalOverallPrice = 0.0;
  bool alreadyCalculated = false;
  String clickToViewTotal = "CLICK TO VIEW TOTAL";
  DocumentSnapshot doc;
//  bool isBuildingAgain;
//  bool calculatedTotal = false;
//  double itemDeductedPrice;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Cart"),
        centerTitle: false,
      ),
      body: StreamBuilder(
          stream: firestore.collection(cartData).where('customerEmail', isEqualTo: widget.accountEmail22.toLowerCase()).orderBy("timeAdded").snapshots(),
          builder: (context,  snapshot){
            if (!snapshot.hasData) {
              return Center(child: Text("There are no snacks added for now..."));
            }else{
              final int dataCount = snapshot.data.documents.length;
              return new ListView.builder(
//                    scrollDirection: Axis.vertical,
//                    shrinkWrap: true,
                itemCount: dataCount,
                itemBuilder: (context, index) {
                  return _buildList(context, snapshot.data.documents[index]);
                },
              );
            }
          }),
      bottomNavigationBar: new BottomAppBar(
        color: Theme.of(context).primaryColor,
        elevation: 0.0,
        shape: new CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: new Container(
          height: 50.0,
          decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: (screenSize.width - 20) / 2,
                child: GestureDetector(
                  onTap: alreadyCalculated == false ? calculateOverrallTotal : null,
                  child: new Text(
                    "$clickToViewTotal",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
              new Container(
                width: (screenSize.width - 20) / 2,
                child: GestureDetector(
                  onTap: OrderNow,
                  child: new Text(
                    "ORDER NOW",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, DocumentSnapshot document) {

    totalOverallPrice = totalOverallPrice + document[totalPrice];
    totalOverallPrice = double.parse(totalOverallPrice.toStringAsFixed(2));

    //addTotal(document);


    return GestureDetector(
      onLongPress: () {
        showAlertDialog(context, document);
      },
      child: new Card(
        child: new Container(
          color: Colors.grey[200],
          width: screenSize.width,
          margin:  new EdgeInsets.only(left: 5.0, right: 5.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Name: ${document[productName]}",
                    style: new TextStyle(color: Colors.black),
                  ),
                  new Text(
                    "Price: \$${document[productPrice]}",
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Category: ${document[productCat]}",
                    style: new TextStyle(color: Colors.black),
                  ),

                  new Text(
                    "Amount: ${document[quantityAmount]}",
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Total: \$${document[totalPrice]}",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.red.withAlpha(250),
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }

  void OrderNow() {
    //we need totalOverrallPrice, customer email, customer name, document
    //payment method(card or cash on delivery),
    showSnackBar("Under Construction...coming soon.", scaffoldKey);
    return;
  }

  void calculateOverrallTotal() {

    clickToViewTotal = "TOTAL: \$${totalOverallPrice}";

    setState(() {

    });

    alreadyCalculated = true;
    print("Total2 : $totalOverallPrice");

  }

  showAlertDialog(BuildContext context, DocumentSnapshot document) {

    doc = document;
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  (){
        Navigator.pop(context);
      },
    );
    Widget deleteButton = FlatButton(
      child: Text("Delete"),
      onPressed:  removeFromCart,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Do you really want to remove this item in cart?"),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void removeFromCart() async{



    await Firestore.instance.runTransaction((Transaction myTransaction) async {
      await myTransaction.delete(doc.reference);
    });



    print("Total1 : $totalOverallPrice");

    Navigator.pop(context);

    refreshScreen();


  }



  void refreshScreen() {
    Navigator.pop(context);

    Navigator.of(context).
    push(new CupertinoPageRoute(builder: (BuildContext context) => new UserCart(accountEmail22: widget.accountEmail22)));

  }
}
