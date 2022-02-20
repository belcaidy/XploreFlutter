import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/constants/app_colors.dart';
import 'package:travel_ui/screens/account_screen.dart';
import 'package:travel_ui/screens/home_page.dart';
import 'package:travel_ui/screens/admin_screen.dart';
class HomeScreenAdmin extends StatefulWidget {
  @override
  _HomeScreenAdminState createState() => _HomeScreenAdminState();
}
class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  int selectedPage=0;
  PageController pageController=PageController();
  final _pageOptions = [
    MyHomePage(),AccountScreen(),AdminScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket,size: 30),label:'Traveler'),

          BottomNavigationBarItem(icon:   Icon(Icons.person,size: 30),label:'Account'),

          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings,size: 30),label:'Admin Panel')
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

