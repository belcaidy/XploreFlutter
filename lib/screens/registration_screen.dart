import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/constants/app_colors.dart';
import 'package:travel_ui/models/userModel.dart';
import 'package:travel_ui/screens/account_screen.dart';
import 'package:travel_ui/screens/home_page.dart';
import 'package:travel_ui/screens/login_screen.dart';
import 'package:travel_ui/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final firstNameEdititngController=new TextEditingController();
  final lastNameEdititngController=new TextEditingController();
  final emailEdititngController=new TextEditingController();
  final confirmPasswordEdititngController=new TextEditingController();
  final passwordEdititngController=new TextEditingController();


  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      style: TextStyle(color: Colors.black),
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value.isEmpty) {
          return ("First Name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Invalid FirstName , minimum 3 characters");
        }
        return null;
      },
      autofocus: false,
      cursorColor: primaryColor,
      controller: firstNameEdititngController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        firstNameEdititngController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        prefixIcon: Icon(
            Icons.person,
            color: primaryColor),

        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor),

        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor,
              width: 2.0),

        ),
      ),
    );
    final lastNameField = TextFormField(
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value.isEmpty) {
          return ("First Name cannot be empty");
        }
        return null;
      },
      autofocus: false,
      cursorColor: primaryColor,
      controller: lastNameEdititngController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        lastNameEdititngController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        prefixIcon: Icon(
            Icons.person_outline,
            color: primaryColor),

        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor),

        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor,
            width: 2.0,),

        ),
      ),
    );
    final emailField = TextFormField(
      style: TextStyle(color: Colors.black),
      validator: (value) {
        if (value.isEmpty) {
          return ("Please Insert your Mail");
        }
        if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Invalid Character");
        }
        return null;
      },
      autofocus: false,
      cursorColor: primaryColor,
      controller: emailEdititngController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        firstNameEdititngController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        prefixIcon: Icon(
            Icons.mail_outline,
            color: primaryColor),

        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Mail ",
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor),

        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor,
            width: 2.0,),

        ),
      ),
    );
    final passwordField = TextFormField(
      style:
      TextStyle(color: Colors.black),

      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value.isEmpty) {
          return ("Password is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Invalid Password , minimum 6 characters");
        }
        return null;
      },
      autofocus: false,
      cursorColor: primaryColor,
      controller: passwordEdititngController,
      obscureText: true,
      onSaved: (value) {
        passwordEdititngController.text = value;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(

            Icons.vpn_key_outlined,
            color: primaryColor),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor),

        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor,
            width: 2.0,),

        ),
      ),
    );
    final passwordConfirmField = TextFormField(
      style:
      TextStyle(color: Colors.black),
      autofocus: false,

      validator: (value) {
        if (passwordEdititngController.text!=value) {
          return ("Password not matched");
        }
        return null;
      },
      cursorColor: primaryColor,
      controller: confirmPasswordEdititngController,
      obscureText: true,
      onSaved: (value) {
        confirmPasswordEdititngController.text = value;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(

            Icons.vpn_key_sharp,
            color: primaryColor),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor),

        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: primaryColor,
              width: 2.0),

        ),
      ),
    );
    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {
            signUp(emailEdititngController.text, passwordEdititngController.text);
          },
          child: Text("Register Now ", textAlign: TextAlign.center, style: TextStyle(
              fontSize: 20, color: backgroundColor, fontWeight: FontWeight.bold),
          )),

    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back ,color: primaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },

        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key:_formKey,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset("assets/logo.png",
                          fit:BoxFit.contain,
                          height: 2000,
                        )),


                    SizedBox(height: 15.0),
                    firstNameField,
                    SizedBox(height: 15.0),
                    lastNameField,
                    SizedBox(height: 15.0),
                    emailField,
                    SizedBox(height: 15.0),
                    passwordField,
                    SizedBox(height: 15.0),
                    passwordConfirmField,
                    SizedBox(height: 15.0),
                    registerButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signUp(String email,String password) async
  {
    if(_formKey.currentState.validate()){
      await _auth.createUserWithEmailAndPassword(email: email,
          password: password).then((value) => {
        postDetailsToFirestore()}).catchError((e){
        msg: e.message;
      });
    }
  }
  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
    User user = _auth.currentUser;
    UserModel userModel= UserModel();
    userModel.email=user.email;
    userModel.uid=user.uid;
    userModel.firstName=firstNameEdititngController.text;
    userModel.secondName=lastNameEdititngController.text;
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set((userModel.toMap()));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("insert Successful"),
    ));
    Navigator.pushAndRemoveUntil((context)
        ,MaterialPageRoute(builder: (context) => HomeScreen()),
            (route)=>false);

  }
}

