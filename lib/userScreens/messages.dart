
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserMessages extends StatefulWidget {
  final String accountEmail3;
  UserMessages({this.accountEmail3});

  @override
  _UserMessagesState createState() => _UserMessagesState();
}



class _UserMessagesState extends State<UserMessages> {


  TextEditingController messageAdminController = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethods = new FirebaseMethods();
  Firestore firestore = Firestore.instance;
  Size screenSize;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Messages To Admin"),
      ),
      body: Stack(
        children: [
          StreamBuilder(
              stream: firestore.collection(messageData).where('UserEmail', isEqualTo: widget.accountEmail3.toLowerCase()).orderBy("timeStamp").snapshots(),
              builder: (context,  snapshot){
                if (!snapshot.hasData) {
                  return Center(child: Text("No messages for now..."));
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
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                messageTextField(
                  sidePadding: 18.0,
                  textHint: "Type Message here...",
                  textIcon: Icons.chat,
                  height1: null,
                  width1: 247,
                  controller: messageAdminController,
                ),
                appButton(
                    btnTxt: "Send",
                    onBtnClicked: sendMessage,
                    btnPadding: 20.0,
                    btnColor: Theme.of(context).primaryColor
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }




//  void openSendMessage() {
//    Navigator.of(context).
//    push(new MaterialPageRoute(builder: (BuildContext context) => new MessageAdmin()));
//  }



  void sendMessage() async{
    if(messageAdminController.text == ""){
      showSnackBar("Please Type In A Message", scaffoldKey);
      return;
    }

    displayProgressDialog(context);

    String response = await appMethods.sendMessageToAdmin(
        message: messageAdminController.text
    );

    if(response == successful){
      closeProgressDialog(context);
//      Navigator.of(context).pop();
      showSnackBar("Message Sent Successfully", scaffoldKey);
      resetMessage1();

    }else{
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }

  void resetMessage1() {
    messageAdminController.text = "";

    setState(() {

    });
  }


  Widget _buildList(BuildContext context, DocumentSnapshot document) {


    bool adminIsSender = false;
    if(document[sender] == "admin"){
      adminIsSender = true;
    }

    if(adminIsSender == true){
      return ListTile(
        title: Align(
            alignment: Alignment.topLeft ,
            child: Container(
                margin: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 5.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: new Text(
                  "${document[messageContent]}",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                )
            )
        ),

        subtitle: Align(
            alignment: Alignment.centerLeft,
            child: new Text(
              "Admin",
              style: new TextStyle(
                color: Colors.black,
                fontSize: 12.0,
              ),
            )
        ),
      );
    }else{
      return ListTile(
        title: Align(
            alignment: Alignment.topRight ,
            child: Container(
                margin: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0, bottom: 5.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    color: Colors.red[700],
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: new Text(
                  "${document[messageContent]}",
                  style: new TextStyle(
                      color: Colors.white,
                    fontSize: 18.0,
                  ),
                )
            )
        ),

        subtitle: Align(
            alignment: Alignment.centerRight,
            child: new Text(
              "${document[UserEmail]}",
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
            )
        ),
      );
    }

  }





}
