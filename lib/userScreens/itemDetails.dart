import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class ItemDetails extends StatefulWidget {
  String itemName;
  String itemPrice;
  String itemImage;
  double itemRating;
  String itemDescription;
  String itemCategory;
  List itemImages;

  ItemDetails({
    this.itemName,
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
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                          height: 10.0,
                        ),
//                          new Text(
//                            "Colors",
//                            style: new TextStyle(
//                                fontSize: 18.0, fontWeight: FontWeight.w700),
//                          ),
                        new SizedBox(
                          height: 100.0,
                        ),
//                          new SizedBox(
//                            height: 50.0,
//                            child: new ListView.builder(
//                                scrollDirection: Axis.horizontal,
//                                itemCount: 4,
//                                itemBuilder: (context, index) {
//                                  return Padding(
//                                    padding: const EdgeInsets.all(4.0),
//                                    child: new ChoiceChip(
//                                        label: new Text("Color ${index}"),
//                                        selected: false),
//                                  );
//                                }),
//                          ),
//                          new SizedBox(
//                            height: 10.0,
//                          ),
//                          new Text(
//                            "Sizes",
//                            style: new TextStyle(
//                                fontSize: 18.0, fontWeight: FontWeight.w700),
//                          ),
//                          new SizedBox(
//                            height: 10.0,
//                          ),
//                          new SizedBox(
//                            height: 50.0,
//                            child: new ListView.builder(
//                                scrollDirection: Axis.horizontal,
//                                itemCount: 4,
//                                itemBuilder: (context, index) {
//                                  return Padding(
//                                    padding: const EdgeInsets.all(4.0),
//                                    child: new ChoiceChip(
//                                        label: new Text("Size ${index}"),
//                                        selected: false),
//                                  );
//                                }),
//                          ),
//                          new SizedBox(
//                            height: 10.0,
//                          ),
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
                            new CircleAvatar(
                              child: new Icon(Icons.remove),
                            ),
                            new Text("0"),
                            new CircleAvatar(
                              child: new Icon(Icons.add),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 50.0,
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
                child: new Text(
                  "ORDER NOW",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
