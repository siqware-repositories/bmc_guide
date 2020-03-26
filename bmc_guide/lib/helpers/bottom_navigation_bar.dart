import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


int _page = 0;
int _index;

class BottomNavBar extends StatefulWidget {

  BottomNavBar(int _p){
    _index = _p;
  }
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) { 
    return CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _index,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.place, size: 25),
            Icon(Icons.home, size: 25),
            Icon(Icons.restaurant, size: 25),
          ],
          color: Color(0xFF0075D1),
          buttonBackgroundColor: Color(0xFF0075D1),
          backgroundColor: Color(0xFF0075D1),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 200),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        );
  }
}