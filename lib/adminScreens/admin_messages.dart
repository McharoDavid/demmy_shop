import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_view_messages.dart';

class AdminMessages extends StatefulWidget {

  final String accountEmail4;
  AdminMessages({this.accountEmail4});

  @override
  _AdminMessagesState createState() => _AdminMessagesState();
}

class _AdminMessagesState extends State<AdminMessages> {

  String userEmail6;
  Size screenSize;

  Firestore firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Admin Messages"),
        centerTitle: false,
      ),
      body: StreamBuilder(
          stream: firestore.collection(messageData).where('receiver', isEqualTo: "admin").where('firstMessage', isEqualTo: "yes").orderBy("timeStamp").snapshots(),
          builder: (context,  snapshot){
            if (!snapshot.hasData) {
              return Center(child: Text("No messages for now..."));
            }else{
              final int dataCount = snapshot.data.documents.length;
              return new ListView.builder(
                itemCount: dataCount,
                itemBuilder: (context, index) {
                  return _adminBuildList(context, snapshot.data.documents[index]);
                },
              );
            }
          }),
    );

  }

  Widget _adminBuildList(BuildContext context, document) {


    userEmail6 = document[UserEmail];


    return ListTile(
      onTap: (){
        Navigator.of(context).
        push(new CupertinoPageRoute(builder: (BuildContext context) => new AdminViewMessages(document)));
      },
      title: Align(
          alignment: Alignment.topLeft ,
          child: Container(
            width: screenSize.width,
              margin: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 5.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: new Text(
                "Message from: ${document[UserEmail]}",
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              )
          )
      ),

      subtitle: Align(
          alignment: Alignment.topCenter,
          child: new Text(
            "${document[timeStamp]}",
            style: new TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          )
      ),
    );
  }

//  void viewMessages() {
//    Navigator.of(context).
//    push(new CupertinoPageRoute(builder: (BuildContext context) => new AdminViewMessages(userEmail12: userEmail6)));
//  }
}


