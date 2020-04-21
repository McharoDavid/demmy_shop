import 'package:demmyshop/adminScreens/admin_home.dart';
import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:demmyshop/userScreens/userSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController AdminEmail = new TextEditingController();
  TextEditingController AdminPassword = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethods = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text("Admin Login"),
        centerTitle: false,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Email Address",
                textIcon: Icons.email,
                controller: AdminEmail
            ),
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Password",
                textIcon: Icons.lock,
                controller: AdminPassword
            ),
            new SizedBox(height: 25.0,),
            appButton(
                btnTxt: "Login",
                onBtnClicked: verifyAdminLogin,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor
            ),
          ],
        ),
      ),
    );
  }

  verifyAdminLogin() async{
    if(AdminEmail.text == ""){
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if(AdminPassword.text == ""){
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    FirebaseUser admin1;

    bool isAdmin = false;

    try{
      admin1 = (await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: AdminEmail.text.toLowerCase(), password: AdminPassword.text.toLowerCase()))
          .user;

      if(admin1 != null) {
        isAdmin = await appMethods.checkAdminExists(admin1.uid);
      }else{
        showSnackBar("Admin is null", scaffoldKey);
      }
    }on PlatformException catch (e){
      print(e.message);
      closeProgressDialog(context);
      showSnackBar(e.message, scaffoldKey);

      String passwordIncorrect = "The password is invalid or the user does not have a password.";
      String emailIncorrect = "There is no user record corresponding to this identifier. The user may have been deleted.";
      if(passwordIncorrect == e.message){
        showSnackBar("Please Try Another Password", scaffoldKey);
      }else if(emailIncorrect == e.message){
        showSnackBar("Please Try Another Email", scaffoldKey);
      }else{
        showSnackBar("Please Try Again", scaffoldKey);
      }
      return;
    }



    String response;

    if(isAdmin == true){
      response = await appMethods.adminLogin(admin2: admin1);
    }else{
      response = "Admin with that email Does Not Exist";
    }


    if(response == successful){
      closeProgressDialog(context);
      Navigator.of(context).
      push(new MaterialPageRoute(builder: (BuildContext context) => new AdminHome()));

    }else{
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
      showSnackBar("Please Try Another Email", scaffoldKey);
    }
  }
}