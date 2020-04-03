import 'package:demmyshop/tools/progressdialog.dart';
import 'package:flutter/material.dart';

Widget appTextField(
    {
      IconData textIcon,
      String textHint,
      bool isPassword,
      double sidePadding,
      TextEditingController controller
    }
    ){
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;

  return Padding(
    padding: new EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0))
      ),
      child: new TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: textHint,
          prefixIcon: textIcon == null ? new Container() : new Icon(textIcon),
          //suffixIcon: isPassword == true ? new IconButton(icon: null, onPressed: null)
        )
        ),
      ),
    );
}

Widget appButton(
    {String btnTxt,
      double btnPadding,
      Color btnColor,
      VoidCallback onBtnClicked
    }
    ) {
  btnTxt == null ? btnTxt = "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.all(btnPadding),
    child: new RaisedButton(
      color: Colors.white.withAlpha(480),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.all(new Radius.circular(15.0))
      ),
      onPressed: onBtnClicked,
      child: Container(
        height: 50.0,
        child: new Center(
          child: new Text(
            btnTxt,
            style: new TextStyle(
                color: btnColor,
                fontSize: 17.0,

            ),
          ),
        ),
      ),
    ),
  );
}

showSnackBar(String message, final scaffoldKey){
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: new Text(
      message,
      style: new TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
  ));
}

displayProgressDialog(BuildContext context){
  Navigator.of(context).push(new PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __){
      return new ProgressDialog();
    }
  ));
}

closeProgressDialog(BuildContext context){
  Navigator.of(context).pop();
}