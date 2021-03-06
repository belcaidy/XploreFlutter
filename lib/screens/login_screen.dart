
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/constants/app_colors.dart';
import 'package:travel_ui/screens/account_screen.dart';
import 'package:travel_ui/screens/home_page.dart';
import 'package:travel_ui/screens/home_screen.dart';
import 'package:travel_ui/screens/registration_screen.dart';
import 'package:travel_ui/screens/home_screen_admin.dart';
class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

// firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      style: TextStyle(color: Colors.black),

      autofocus: false,
      cursorColor: primaryColor,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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

      onSaved: (value) {
        emailController.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(

        prefixIcon: Icon(
            Icons.mail,
            color: primaryColor),

        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
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


      autofocus: false,
      cursorColor: primaryColor,
      controller: passwordController,
      obscureText: true,
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
      onSaved: (value) {
        passwordController.text = value;
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
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: MaterialButton(

          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text("Login", textAlign: TextAlign.center, style: TextStyle(
              fontSize: 20, color: backgroundColor, fontWeight: FontWeight.bold),
          )),

    );


    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset("assets/logo.png",
                          fit: BoxFit.contain,
                          height: 2000,
                        )),
                    SizedBox(height: 25.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 45.0),
                    loginButton,
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                          },
                          child: Text("Sign Up", style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),),
                        )

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // function login
  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      if(email == 'user101@gmail.com' && password == 'Azerty1'){
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Successful"),
          )),
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreenAdmin(),),)}).catchError((e){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message),
          ));

        });
      }
      else{
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Login Successful"),
          )),
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen(),),)}).catchError((e){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message),
          ));

        });
      }
      // end
    }
  }

}
