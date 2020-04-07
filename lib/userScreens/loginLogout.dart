import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/userScreens/userSignup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;

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
              controller: email
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

  verifyLogin(){
    if(email.text == ""){
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if(password.text == ""){
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }
    
    displayProgressDialog(context);
  }
}
