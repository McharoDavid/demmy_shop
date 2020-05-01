
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AppMethods{
  Future<String> loginUser({FirebaseUser user2});
  Future<String> adminLogin({FirebaseUser admin2});
  Future<String> createUserAccount(
      {String fullName,
        String phone,
        String email,
        String password
      });

  Future<String> sendMessageToAdmin({String message});

  //Future<String> deleteMessage({DocumentSnapshot doc});

  Future<bool> LogoutUser();
  Future<DocumentSnapshot> getUserInfo(String userID);
  Future<DocumentSnapshot> getAdminInfo(String adminIDD);
  Future<String> addNewProduct({Map newProduct});
  Future<List<String>> uploadProductImages({List<File> imageList, String docID});
  Future<bool> updateProductImages({
    String docID,
    List<String> data,
  });
  Future<bool> checkAdminExists(String adminIDDD);

  Future<String> sendMessageToUser({String message, String userEmail00}) {}
}