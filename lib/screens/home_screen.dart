import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/constants/app_colors.dart';
import 'package:travel_ui/screens/account_screen.dart';
import 'package:travel_ui/screens/home_page.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int selectedPage=0;
  PageController pageController=PageController();
  final _pageOptions = [
    MyHomePage(),AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket,size: 30),label:'Traveler'),

          BottomNavigationBarItem(icon:   Icon(Icons.person,size: 30),label:'Account')
        ],
        elevation: 5.0,
        onTap: (index){
          setState(() {
            selectedPage = index;});},
        currentIndex: selectedPage ,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}

