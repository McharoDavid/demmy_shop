import 'dart:io';

import 'package:demmyshop/tools/progressdialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField(
    {
      IconData textIcon,
      String textHint,
      bool isPassword,
      double sidePadding,
      TextInputType textType,
      TextEditingController controller,
      int maxLinezz,
      double height
    }
    ){
  height == null ? height = 50.0 : height;
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  textType == null ? textType = TextInputType.text : textType;

  return Padding(
    padding: new EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0))
      ),
      child: new TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword, keyboardType: textType,
        maxLines: maxLinezz == null ? 1 : maxLinezz,
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

Widget messageTextField(
    {
      IconData textIcon,
      String textHint,
      double sidePadding,
      TextInputType textType,
      TextEditingController controller,
      double height1,
      double width1,
    }
    ){
  height1 == null ? height1 = null : height1;
  width1 == null ? width1 = 50.0 : width1;
  sidePadding == null ? sidePadding = 0.0 : sidePadding;
  textHint == null ? textHint = "" : textHint;
  textType == null ? textType = TextInputType.text : textType;

  return Padding(
    padding: new EdgeInsets.only(left: sidePadding, right: sidePadding),
    child: new Container(
      width: width1,
      height: height1,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))
      ),
      child: new TextField(
          controller: controller,
          maxLines: null,
          minLines: 1,
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

Widget productTextField({
  String textTitle,
  String textHint,
  double height,
  double price,
  TextEditingController controller,
  TextInputType textType,
  int maxLinez}){

  textHint == null ? textHint = "Enter Hint" : textHint;
  textTitle == null ? textTitle = "Enter Title" : textTitle;
  height == null ? height = 50.0 : height;
  price == null ? price = 0.0 : price;
  //height != null ? height = 50.0 : height;

  return new Column(
    //mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style: new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      new Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Container(
          height: height,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: new Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new TextField(
              controller: controller,
              keyboardType: textType == null ? TextInputType.text : textType,
              maxLines: maxLinez == null ? null : maxLinez,
              decoration: new InputDecoration(
                  border: InputBorder.none, hintText: textHint),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget productDropDown(
    {String textTitle,
      String selectedItem,
      Size size,
      List<DropdownMenuItem<String>> dropDownItems,
      ValueChanged<String> changedDropDownItems}) {
  textTitle == null ? textTitle = "Enter Title" : textTitle;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          textTitle,
          style:
          new TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          width: size.width,
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(color: Colors.white),
              borderRadius: new BorderRadius.all(new Radius.circular(4.0))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),

            child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                  value: selectedItem,
                  items: dropDownItems,
                  onChanged: changedDropDownItems,
                )),
          ),
        ),
      ),
    ],
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

Widget multiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? new Container()
        : new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return new Padding(
              padding: new EdgeInsets.only(left: 3.0, right: 3.0),
              child: new Stack(
                children: <Widget>[
                  new Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.withAlpha(100),
                        borderRadius: new BorderRadius.all(
                            new Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new FileImage(imageList[index]))),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new CircleAvatar(
                      backgroundColor: Colors.red[600],
                      child: new IconButton(
                          icon: new Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            removeNewImage(index);
                          }),
                    ),
                  )
                ],
              ),
            );
          }),
    ),
  );
}

Widget buildImages({int index, Map imagesMap}) {
  return imagesMap.isEmpty ? new Container(
    width: 150.0,
    height: 150.0,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Icon(
          Icons.image,
          size: 100.0,
          color: Colors.white,
        ),
        new Icon(
          Icons.add_circle,
          color: Colors.grey,
        ),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.grey.withAlpha(100),
    ),
  ) : imagesMap[index] != null ? new Container(
    width: 150.0,
    height: 150.0,
    decoration: new BoxDecoration(
        color: Colors.grey.withAlpha(100),
        image: new DecorationImage(
            fit: BoxFit.cover,
            image: new FileImage(imagesMap[index]))),
  ) : new Container(
    width: 150.0,
    height: 150.0,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Icon(
          Icons.image,
          size: 100.0,
          color: Colors.white,
        ),
        new Icon(
          Icons.add_circle,
          color: Colors.grey,
        ),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.grey.withAlpha(100),
    ),
  );
}

List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
  List<DropdownMenuItem<String>> items = new List();
  for (String size in size) {
    items.add(new DropdownMenuItem(value: size, child: new Text(size)));
  }
  return items;
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

//showSnackBar2(String message1, final scaffoldKey1){
//  scaffoldKey1.currentState.showSnackBar2(new SnackBar(
//    backgroundColor: Colors.green[600],
//    content: new Text(
//      message1,
//      style: new TextStyle(color: Colors.white),
//      textAlign: TextAlign.center,
//    ),
//  ));
//}

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

writeDataLocally({String key, String value}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setString(key, value);
}

writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}

getDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}
getStringDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key);
}

getBoolDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key) == null ? false : localData.get(key);
}

clearDataLocally() async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.clear();
}


