
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMethods{
  Future<String> LoginUser({String email, String password});
  Future<String> createUserAccount(
      {String fullName,
        String phone,
        String email,
        String password
      });

  Future<bool> LogoutUser();
  Future<DocumentSnapshot> getUserInfo(String userID);
}