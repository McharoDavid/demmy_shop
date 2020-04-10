
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app_data.dart';
import 'app_tools.dart';
import 'package:flutter/services.dart';

class FirebaseMethods implements AppMethods{
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Future<String> LoginUser({String email, String password}) async{
    // TODO: implement LoginUser
    FirebaseUser user;

    try{
//      user = await auth.signInWithEmailAndPassword(
//          email: email,
//          password: password);

      user = (await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password))
          .user;

      if(user != null){
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(
            key: accountFullName, value: userInfo[accountFullName]);
        await writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoUrl, value: userInfo[photoUrl]);
        await writeBoolDataLocally(key: loggedIn, value: true);

        print(userInfo[userEmail]);
      }
    }on PlatformException catch (e){
      //print(e.details);
      return errorMSG(e.message);
    }

    return user == null ? errorMSG("Error: user is null") : successfulMSG();

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

}