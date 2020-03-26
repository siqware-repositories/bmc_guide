import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:bmc_guide/screens/detail_screen/place_detail_screen.dart';
import 'package:bmc_guide/screens/home_screens/home_screen.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/material.dart';

var screens = [
  TravelHome(),
  HomeScreen(),
  TravelHome(),
];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF3F3F3F3),
        appBar: AppBar(
          title: Text('List Page'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFF00A2E3),Color(0xFF0075D1)])),
          ),
        ),
        drawer: DrawerNavigation(),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
              barBackgroundColor: Colors.white,
              selectedItemBorderColor: Colors.white,
              selectedItemBackgroundColor: Color(0xFF0075D1),
              selectedItemIconColor: Colors.white,
              selectedItemLabelColor: Color(0xFF0075D1),
              unselectedItemIconColor: Color(0xFF0075D1),
              unselectedItemLabelColor: Color(0xFF0075D1)),
          selectedIndex: _page,
          onSelectTab: (index) {
            setState(() {
              _page = index;
            });
          },
          items: [
            FFNavigationBarItem(
              iconData: Icons.place,
              label: 'Place',
            ),
            FFNavigationBarItem(
              iconData: Icons.home,
              label: 'Home',
            ),
            FFNavigationBarItem(
              iconData: Icons.restaurant,
              label: 'Restaurant',
            ),
          ],
        ),
        body: Container(
          child: screens[_page],
        ));
  }
}
