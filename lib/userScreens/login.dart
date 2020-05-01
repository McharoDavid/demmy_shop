import 'package:demmyshop/tools/app_data.dart';
import 'package:demmyshop/tools/app_methods.dart';
import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/tools/firebase_methods.dart';
import 'package:demmyshop/userScreens/userSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
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
        title: new Text("Login"),
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
              controller: email,
            ),
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Password",
                textIcon: Icons.lock,
              controller: password
            ),
            new SizedBox(height: 25.0,),
            appButton(
              btnTxt: "Login",
              onBtnClicked: verifyLogin,
              btnPadding: 20.0,
              btnColor: Theme.of(context).primaryColor
            ),
            new GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context)=> new UserSignUp()));
              },
              child: new Text(
                "Not registered? Sign Up here",
                style: new TextStyle(color: Colors.white, decoration: TextDecoration.underline ),

              ),
            )
          ],
        ),
      ),
    );
  }

  verifyLogin() async{
    if(email.text == ""){
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if(password.text == ""){
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }
    
    displayProgressDialog(context);

    FirebaseUser user1;

    bool isAdmin = false;


    try{
      user1 = (await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email.text.toLowerCase(), password: password.text.toLowerCase()))
          .user;

      if(user1 != null) {
        isAdmin = await appMethods.checkAdminExists(user1.uid);
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

    if(isAdmin == false){
      response = await appMethods.loginUser(user2: user1);
    }else if(isAdmin == true){
      response = await appMethods.adminLogin(admin2: user1);
    }


    if(response == successful){
      closeProgressDialog(context);
      if(isAdmin == false){
        Navigator.of(context).pop(true);
      }else if(isAdmin == true){
        Navigator.of(context).pop(false);
      }
    }else{
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
