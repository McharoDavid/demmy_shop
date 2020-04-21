
import 'dart:io';

import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'app_data.dart';
import 'app_tools.dart';
import 'package:flutter/services.dart';

class FirebaseMethods implements AppMethods{
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  DocumentReference documentRef;

  final scaffoldKey = new GlobalKey<ScaffoldState>();




  @override
  Future<String> loginUser({FirebaseUser user2}) async{
    // TODO: implement LoginUser

    try{
        DocumentSnapshot userInfo = await getUserInfo(user2.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(
            key: accountFullName, value: userInfo[accountFullName]);
        await writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoUrl, value: userInfo[photoUrl]);
        await writeBoolDataLocally(key: loggedIn, value: true);

        print(userInfo[userEmail]);

        return successfulMSG();

    }on PlatformException catch (e){
      print(e.message);
      showSnackBar(e.message, scaffoldKey);
      return errorMSG("Error");
    }



  }

  @override
  Future<String> createUserAccount({String fullName, String phone, String email, String password}) async{
    // TODO: implement createUserAccount

    FirebaseUser user1;

    try{
//      user = (await auth.createUserWithEmailAndPassword(
//          email: email,
//          password: password)) as FirebaseUser;
//
      user1 = (await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: email, password: password))
          .user;

      if (user1 != null){
        await firestore.collection(usersData).document(user1.uid).setData({
          userID : user1.uid,
          accountFullName : fullName,
          phoneNumber : phone,
          userEmail : email,
          userPassword : password
        });

        writeDataLocally(key: userID, value: user1.uid);
        writeDataLocally(key: accountFullName, value: fullName);
        writeDataLocally(key: phoneNumber, value: phone);
        writeDataLocally(key: userEmail, value: email);
        writeDataLocally(key: userPassword, value: password);
      }
    }on PlatformException catch (e){
      //print(e.details);
      return errorMSG(e.message);
    }

    //Here is where the error is. Account is created in the firebase but it
    return user1 == null ? errorMSG("Error: user is null") : successfulMSG();

  }

  Future<bool> complete() async{
    return true;
  }

  Future<bool> notComplete() async{
    return false;
  }

  Future<String> successfulMSG() async {
    return successful;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  @override
  Future<bool> LogoutUser() async{
    // TODO: implement LogoutUser
    await auth.signOut();
    await clearDataLocally();
    return complete();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userID) async{
    // TODO: implement getUserInfo
    return await firestore.collection(usersData).document(userID).get();
  }

  @override
  Future<String> addNewProduct({Map newProduct}) async{
    String documentIDD;

    await firestore.collection(appProducts).add(newProduct).then((documentRef){
      documentIDD = documentRef.documentID;
    });


    return documentIDD;
  }

  @override
  Future<List<String>> uploadProductImages({List<File> imageList, String docID}) async{
    // TODO: implement uploadProductImages
    List<String> imagesUrl = new List();


    try{
      for(int s = 0; s < imageList.length; s++){
        StorageReference storageReference = FirebaseStorage.instance.ref()
            .child(appProducts).child(docID).child(docID + "$s.jpg");

        StorageUploadTask uploadTask = (storageReference.putFile(imageList[s]));

        var downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

        imagesUrl.add(downloadUrl.toString());
      }

    } on PlatformException catch (e){
      imagesUrl.add(error);
      print(imagesUrl);
      print(e.message);
    }
    return imagesUrl;
  }

  @override
  Future<bool> updateProductImages({String docID, List<String> data}) async{
    // TODO: implement updateProductImages
    bool msg;
    await firestore.collection(appProducts).document(docID)
      .updateData({productImages: data}).whenComplete((){
        msg = true;
    });
    return msg;
  }

  @override
  Future<String> adminLogin({FirebaseUser admin2}) async{
    // TODO: implement AdminLoginUser

    try{
      // ignore: unrelated_type_equality_checks
      DocumentSnapshot adminInfo = await getAdminInfo(admin2.uid);
      //await writeDataLocally(key: adminID, value: adminInfo[admin.uid]);
      await writeDataLocally(
          key: adminFullName, value: adminInfo[adminFullName]);
      await writeDataLocally(key: adminEmail, value: adminInfo[adminEmail]);
      await writeDataLocally(key: adminPhone, value: adminInfo[adminPhone]);
//      await writeDataLocally(key: photoUrl, value: adminInfo[photoUrl]);
      await writeBoolDataLocally(key: loggedIn, value: true);

      print(adminInfo[adminEmail]);

      return successfulMSG();

    }on PlatformException catch (e){
      print(e.message);
      showSnackBar(e.message, scaffoldKey);
      return errorMSG("Error");
    }


  }

  @override
  Future<DocumentSnapshot> getAdminInfo(String adminIDD) async{
    // TODO: implement getAdminInfo
    return await firestore.collection(adminData).document(adminIDD).get();
  }

  @override
  Future<bool> checkAdminExists(String adminIDDD) async{
    // TODO: implement checkAdminExists
    bool exists = false;
    try {
      await firestore.collection(adminData).document(adminIDDD).get().then((doc) {
        if (doc.exists){
          exists = true;
        }else{
          exists = false;
        }
      });
      return exists;
    } catch (e) {
      print(e.details);
      return false;
    }
  }
}