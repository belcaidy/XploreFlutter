import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/constants/app_colors.dart';
import 'package:travel_ui/screens/account_screen.dart';
import 'package:travel_ui/screens/home_page.dart';
class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}
class _AdminScreenState extends State<AdminScreen> {

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(

      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("XploreEMSI Home"),
        centerTitle: true,
      ),
      body: ListView(

        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {},
            child: const Text('Hotels'),
          ),
        ],
      ),
    );
  }
}

