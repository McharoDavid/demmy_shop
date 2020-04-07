import 'package:demmyshop/tools/app_tools.dart';
import 'package:demmyshop/userScreens/loginLogout.dart';
import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  TextEditingController fullName = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController verifyPassword = new TextEditingController();
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
        title: new Text("Sign Up"),
        centerTitle: false,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Full Name",
                textIcon: Icons.person,
                textType: TextInputType.text,
                controller: fullName
            ),
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Phone Number",
                textIcon: Icons.phone,
                textType: TextInputType.phone,
                controller: phoneNumber
            ),
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: false,
                sidePadding: 18.0,
                textHint: "Email Address",
                textIcon: Icons.email,
                textType: TextInputType.text,
                controller: email
            ),
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Password",
                textIcon: Icons.lock,
                textType: TextInputType.text,
                controller: password
            ),
            new SizedBox(height: 30.0,),
            appTextField(
                isPassword: true,
                sidePadding: 18.0,
                textHint: "Verify Password",
                textIcon: Icons.lock,
                textType: TextInputType.text,
                controller: verifyPassword
            ),
            new SizedBox(height: 25.0,),
            appButton(
                btnTxt: "Create Account",
                onBtnClicked: verifyDetails,
                btnPadding: 20.0,
                btnColor: Theme.of(context).primaryColor
            ),
            new GestureDetector(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context)=> new Login()));
              },
              child: new Text(
                "Already Registered? Login here",
                style: new TextStyle(color: Colors.white, decoration: TextDecoration.underline ),

              ),
            )
          ],
        ),
      ),
    );
  }

  verifyDetails(){
    if(fullName.text == ""){
      showSnackBar("Full Name cannot be empty", scaffoldKey);
      return;
    }

    if(phoneNumber.text == ""){
      showSnackBar("Phone number cannot be empty", scaffoldKey);
      return;
    }
    if(email.text == ""){
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if(password.text == ""){
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    if(verifyPassword.text == ""){
      showSnackBar("Verify password cannot be empty", scaffoldKey);
      return;
    }

    if(password.text != verifyPassword.text){
      showSnackBar("Passwords don't match", scaffoldKey);
      return;
    }


    displayProgressDialog(context);
  }
}
