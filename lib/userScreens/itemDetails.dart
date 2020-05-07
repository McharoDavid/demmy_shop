import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'cart.dart';

class ItemDetails extends StatefulWidget {
  String itemName;
  String itemPrice;
  String itemImage;
  double itemRating;
  String itemDescription;
  String itemCategory;
  String itemId;
  List itemImages;

  ItemDetails({
    this.itemName,
    this.itemId,
    this.itemPrice,
    this.itemImage,
    this.itemRating,
    this.itemCategory,
    this.itemDescription,
    this.itemImages
  });
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  Firestore firestore = Firestore.instance;
  int numberOfItemsInCart = 0;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethods = new FirebaseMethods();

  int _n = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text("Snack Details"),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: new Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Container(
            height: 300.0,
            decoration: new BoxDecoration(
                image: DecorationImage(
                    image: new NetworkImage(widget.itemImage),
                    fit: BoxFit.fitHeight
                ),
              borderRadius: new BorderRadius.only(
                bottomRight: new Radius.circular(120.0),
                  bottomLeft: new Radius.circular(120.0)
              )
            ),
          ),
          new Container(
            height: 300.0,
            decoration: new BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: new BorderRadius.only(
                    bottomRight: new Radius.circular(120.0),
                    bottomLeft: new Radius.circular(120.0)
                )
            ),
          ),
          new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 50.0,
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin:  new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          widget.itemName,
                          style: new TextStyle(
                            fontSize: 18.0,fontWeight: FontWeight.w700
                          ),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          widget.itemCategory,
                          style: new TextStyle(
                              fontSize: 14.0,fontWeight: FontWeight.w400
                          ),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Icon(
                                  Icons.star,
                                  color: Colors.blueGrey,
                                  size: 20.0,
                                ),
                                new SizedBox(
                                  width: 5.0,
                                ),
                                new Text(
                                  "${widget.itemRating}",
                                  style: new TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            new Text(
                              "\$${widget.itemPrice}",
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red.withAlpha(250),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    height: 150.0,
                    child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.itemImages.length,
                      itemBuilder: (context, index){
                        return new Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new Container(
                              margin:
                              new EdgeInsets.only(left: 5.0, right: 5.0),
                              height: 140.0,
                              width: 100.0,
                              child: new Image.network(widget.itemImages[index]),
                            ),
                            new Container(
                              margin:
                              new EdgeInsets.only(left: 5.0, right: 5.0),
                              height: 140.0,
                              width: 100.0,
                              decoration: new BoxDecoration(
                                color: Colors.grey.withAlpha(50)
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Description",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          widget.itemDescription,
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                new Card(
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 35.0,
                        ),


                        new Text(
                          "Amount",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new FloatingActionButton(
                              onPressed: minus,
                              heroTag: "floatingbtn1",
                              child: new Icon(Icons.remove, color: Colors.black,),
                              backgroundColor: Colors.white,),

                            new Text('$_n',
                                style: new TextStyle(fontSize: 30.0)),


                            new FloatingActionButton(
                              heroTag: "floatingbtn2",
                              onPressed: add,
                              child: new Icon(Icons.add, color: Colors.black,),
                              backgroundColor: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
        floatingActionButton: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new FloatingActionButton(onPressed: (){
              checkCart();
            },
                child: new Icon(Icons.shopping_cart)),
            new CircleAvatar(
              radius: 9.5,
              backgroundColor: Colors.red,
              child: countItemsInCart1(),
            )
          ],
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                child: new Text(
                  "ADD TO FAVORITES",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700
                  ),
                ),
              ),
              new Container(
                width: (screenSize.width - 20) / 2,
                child: GestureDetector(
                  onTap: addToCart,
                  child: new Text(
                    "ADD TO CART",
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

  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }

  void add() {
    setState(() {
      _n++;
    });
  }


  void addToCart() async{
    //cartid, customerEmail, productid, productName, productCategory, productDesc,
    //productPrice, amount, totalPrice

    if (_n == 0) {
      showSnackBar("Amount cannot be zero", scaffoldKey);
      return;
    }

    if (await FirebaseAuth.instance.currentUser() == null) {

      showSnackBar("Please Login first to add to cart", scaffoldKey);
      return;

    }else{
      print(widget.itemId);
      //show the progress Dialog
      displayProgressDialog(context);

      String userEmail2 = await getStringDataLocally(key: userEmail);

      //String customerEmail, String productId, String productName,
    //String productCategory, String productDesc, String productPrice, int amount

      String response = await appMethods.addToCart(
          customerEmail1: userEmail2,
        productId1: widget.itemId,
        productName1: widget.itemName,
        productCategory1: widget.itemCategory,
        productDesc1: widget.itemDescription,
        productPrice1: widget.itemPrice,
        amount1: _n
      );

      if(response == successful){
        closeProgressDialog(context);
        //Navigator.of(context).pop();
        resetAmount();
        showSnackBar("Product Added To Cart Successfully", scaffoldKey);

      }else{
        closeProgressDialog(context);
        showSnackBar(response, scaffoldKey);
      }
    }
  }

  void resetAmount() {
    _n = 0;
    setState(() {

    });
  }

  void checkCart() async{

    if (await FirebaseAuth.instance.currentUser() == null) {

    showSnackBar("Please login first to check cart", scaffoldKey);
    return;

    }else{
      String userEmail23 = await getStringDataLocally(key: userEmail);

      Navigator.of(context).
      push(new CupertinoPageRoute(builder: (BuildContext context) => new UserCart(accountEmail22: userEmail23)));
    }


  }

  Widget countItemsInCart1(){

    countFunction();



    return new Text(
      "$numberOfItemsInCart",
      style: new TextStyle(
          color: Colors.white,
          fontSize: 13.0
      ),
    );

  }

  void countFunction() async{
    int length1 = await appMethods.countItemsInCart();



    if(length1 == -1){
      showSnackBar("Error: error displaying numbers of items in the cart, Check console for the error message", scaffoldKey);
    }else{
      numberOfItemsInCart = length1;
    }

    setState(() {

    });

  }
}
