

import 'dart:io';

import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProducts extends StatefulWidget {
  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  Size screenSize;
  List<DropdownMenuItem<String>> dropDownCategories;
  String selectedCategory;
  List<String> categoryList = new List();
  List<File> imageList;

  Map<int, File> imagesMap = new Map();

  TextEditingController productTitleController = new TextEditingController();
  TextEditingController productPriceController = new TextEditingController();
  TextEditingController productDescController = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = new List.from(localCategories);
    dropDownCategories = buildAndGetDropDownItems(categoryList);
    selectedCategory = dropDownCategories[0].value;
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        title: new Text("Add Products"),
        centerTitle: false,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: new RaisedButton.icon(
                color: Colors.blueGrey[400],
                shape: new RoundedRectangleBorder(
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(15.0))),
                onPressed: () => pickImage(),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: new Text(
                  "Add Images",
                  style: new TextStyle(color: Colors.white),
                )
            ),
          )
        ],
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           new SizedBox(height: 20.0,),
           multiImagePickerList(
             imageList: imageList,
            removeNewImage: (index){
               removeImage(index);
            }),
           new SizedBox(height: 20.0,),
            productTextField(textTitle: "Product Name:", textHint: "Enter Product Name", controller: productTitleController),
           new SizedBox(height: 20.0,),
           productDropDown(
               textTitle: "Product Category:",
               selectedItem: selectedCategory,
               dropDownItems: dropDownCategories,
               size: screenSize,
               changedDropDownItems: changedDropDownCategory),
           new SizedBox(height: 20.0,),
           productTextField(textTitle: "Product Price:", textHint: "Enter Product Price", textType: TextInputType.number, controller: productPriceController),
           new SizedBox(height: 20.0,),
           productTextField(
               textTitle: "Product Description:",
               textHint: "Enter Product Description",
               maxLinez: 4,
               height: 180.0,
               controller: productDescController,
           ),
           appButton(
               btnTxt: "Add Product",
               onBtnClicked: addNewProducts,
               btnPadding: 20.0,
               btnColor: Theme.of(context).primaryColor
           ),
          ],
        ),
      ),
    );

  }

  void changedDropDownCategory(String selectedSize) {
    setState(() {
      selectedCategory = selectedSize;
    });
  }

  pickImage() async {
    File file = (await ImagePicker.pickImage(source: ImageSource.gallery));
    if (file != null) {
      //imagesMap[imagesMap.length] = file;
      List<File> imageFile = new List();
      imageFile.add(file);
      //imageList = new List.from(imageFile);
      if (imageList == null) {
        imageList = new List.from(imageFile, growable: true);
      } else {
        for (int s = 0; s < imageFile.length; s++) {
          imageList.add(file);
        }
      }
      setState(() {});
    }
  }

  removeImage(int index) async {
    //imagesMap.remove(index);
    imageList.removeAt(index);
    setState(() {});
  }

  AppMethods appMethods = new FirebaseMethods();

  addNewProducts() async{
    if (imageList == null || imageList.isEmpty) {
      showSnackBar("Product Images cannot be empty", scaffoldKey);
      return;
    }

    if (productTitleController.text == "") {
      showSnackBar("Product Title cannot be empty", scaffoldKey);
      return;
    }

    if (selectedCategory == "Select Product Category") {
      showSnackBar("Please select a category", scaffoldKey);
      return;
    }

    if (productPriceController.text == "") {
      showSnackBar("Product Price cannot be empty", scaffoldKey);
      return;
    }

    if (productDescController.text == "") {
      showSnackBar("Product Description cannot be empty", scaffoldKey);
      return;
    }

    //show the progress Dialog
    displayProgressDialog(context);



    //get the text from the individual controllers title, price, description
    Map<String, dynamic> newProduct = {
      productTitle: productTitleController.text,
      productPrice: productPriceController.text,
      productDesc: productDescController.text,
      productCategory: selectedCategory,
    };

    //Add the information to firebase
    String productID = await appMethods.addNewProduct(newProduct: newProduct).whenComplete((){
      showSnackBar("Product information has been added successfully", scaffoldKey);
    });

    //now time to upload the images to firebase storage
    List<String> imagesUrl = await appMethods.uploadProductImages(docID: productID, imageList: imageList);

    //check if an error occurred while adding image to firebase storage, and if error occurs terminate
    if(imagesUrl.contains(error)){
      closeProgressDialog(context);
      showSnackBar("Image upload error, contact the app developer", scaffoldKey);
      return;
    }


    //update the information after uploading image file to the storage
    bool result = await appMethods.updateProductImages(docID: productID, data: imagesUrl);

    if(result != null && result == true){
      closeProgressDialog(context);
      resetEverything();
      showSnackBar("Product Added Successfully", scaffoldKey);
      //Navigator.of(context).pop(true);

    } else{
      closeProgressDialog(context);
      showSnackBar("An error occured while adding product, contact the app developer", scaffoldKey);
    }


  }

  void resetEverything() {
    imageList.clear();
    productTitleController.text = "";
    productPriceController.text = "";
    productDescController.text = "";
    selectedCategory = "Select Product Category";

    setState(() {

    });

  }
}
