import 'package:bmc_guide/screens/detail_screen/hotel_detail_screen.dart';
import 'package:bmc_guide/screens/detail_screen/place_detail_screen.dart';
import 'package:bmc_guide/screens/detail_screen/restaurant_detail_screen.dart';
import 'package:bmc_guide/screens/home_screens/home_screen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/material.dart';

int _page = 2;

var screens = [
  TravelHome(), HotelHome(), HomeScreen(), RestaurantHome(), HomeScreen()
]; 

class MainPage extends StatefulWidget {

  MainPage(_p){
    _page = _p;
  }
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF3F3F3F3),
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
            ),FFNavigationBarItem(
              iconData: Icons.hotel,
              label: 'Hotel',
            ),
            FFNavigationBarItem(
              iconData: Icons.home,
              label: 'Home',
            ),
            FFNavigationBarItem(
              iconData: Icons.restaurant,
              label: 'Restaurant',
            ),FFNavigationBarItem(
              iconData: Icons.directions_bike,
              label: 'Service',
            ),
          ],
        ),
        body: Container(
          child: screens[_page],
        ));
  }
}
