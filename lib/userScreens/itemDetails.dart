import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  ItemDetails({
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.itemRating
  });
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}
