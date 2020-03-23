import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  DrawerNavigation({Key key}) : super(key: key);

  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Tun Cham Roeun"),
            accountEmail: Text("tun.chamroeun@siqware.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () {},
          ),
          ListTile(
            title: Text("Category"),
            leading: Icon(Icons.category),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
