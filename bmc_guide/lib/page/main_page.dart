import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:bmc_guide/screens/detail_screen/place_detail_screen.dart';
import 'package:bmc_guide/screens/home_screens/home_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

var screens = [TravelHome(), HomeScreen(), TravelHome(),];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      drawer: DrawerNavigation(),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.place, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.restaurant, size: 30),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.pinkAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          child: screens[_page],)
        );
  }
}