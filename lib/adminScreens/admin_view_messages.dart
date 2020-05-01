import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:flutter/material.dart';

class AdminViewMessages extends StatefulWidget {

  final DocumentSnapshot document;
  AdminViewMessages(this.document);

  @override
  _AdminViewMessagesState createState() => _AdminViewMessagesState();
}

class _AdminViewMessagesState extends State<AdminViewMessages> {

  TextEditingController messageUserController = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethods = new FirebaseMethods();
  Firestore firestore = Firestore.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.document[UserEmail]),
      ),
      body: StreamBuilder(
          stream: firestore.collection(messageData).where('UserEmail', isEqualTo: widget.document[UserEmail].toLowerCase()).orderBy("timeStamp").snapshots(),
          builder: (context,  snapshot){
            if (!snapshot.hasData) {
              return Center(child: Text("No messages for now..."));
            }else{
              final int dataCount = snapshot.data.documents.length;
              return new ListView.builder(
                itemCount: dataCount,
                itemBuilder: (context, index) {
                  return _buildList(context, snapshot.data.documents[index]);
                },
              );
            }
          }),
      bottomNavigationBar: new Row(
        children: [
          messageTextField(
            sidePadding: 18.0,
            textHint: "Type Message here...",
            textIcon: Icons.chat,
            height1: 50,
            width1: 247,
            maxLinezz: 4,
            controller: messageUserController,
          ),
          appButton(
              btnTxt: "Send",
              onBtnClicked: sendMessageToUser1,
              btnPadding: 20.0,
              btnColor: Theme.of(context).primaryColor
          ),
        ],
      ),
    );
  }

  void sendMessageToUser1() async{
    if(messageUserController.text == ""){
      showSnackBar("Please Type In A Message", scaffoldKey);
      return;
    }

    displayProgressDialog(context);

    String userEmail0 = widget.document[UserEmail];

    String response = await appMethods.sendMessageToUser(
        message: messageUserController.text,
      userEmail00: userEmail0
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
    messageUserController.text = "";

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
            alignment: Alignment.topRight ,
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
            alignment: Alignment.centerRight,
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
            alignment: Alignment.topLeft ,
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
            alignment: Alignment.centerLeft,
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
