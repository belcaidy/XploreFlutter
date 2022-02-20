import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/models/userModel.dart';
import 'package:travel_ui/widgets/destinations_carousel.dart';
import 'package:travel_ui/widgets/filterable_icons.dart';
import 'package:travel_ui/widgets/hotels_carousel.dart';

class MyHomePage extends StatefulWidget {


  final String title= "What would you like to find?";

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String _title;

  _MyHomePageState(this._title);
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 38, right: 80, left: 14, bottom: 20),
            child: Text("What would you like to find ${loggedUser.firstName} ${loggedUser.secondName} ?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
          FilterableIcons(),
          SizedBox(height: 8),
          DestinationsCarousel(),
          HotelsCarousel(),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
