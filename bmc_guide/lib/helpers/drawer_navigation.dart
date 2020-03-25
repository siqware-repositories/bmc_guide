import 'package:bmc_guide/app/plugins/animation1.dart';
import 'package:bmc_guide/app/plugins/oval_right_clipper.dart';
import 'package:bmc_guide/screens/home_screens/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


final Color primary = Color(0xff291747);
final Color active = Color(0xff6C48AB);

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildDrawer(context),
    );
  }
}

_buildDrawer(BuildContext context) {
    final String image = images[0];
    
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.pink, Colors.deepPurple])),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "erika costell",
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  Text(
                    "@erika07",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(context, Icons.home, "Home", HomeScreen()),
                  _buildDivider(),
                  _buildRow(context, Icons.person_pin, "Your profile", HomeScreen()),
                  _buildDivider(),
                  _buildRow(context, Icons.settings, "Settings", HomeScreen()),
                  _buildDivider(),
                  _buildRow(context, Icons.email, "Contact us", HomeScreen()),
                  _buildDivider(),
                  _buildRow(context, Icons.info_outline, "Help", HomeScreen()),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  Widget _buildRow(BuildContext context, IconData icon, String title, var className) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
            title: Text(title, style: tStyle,),
            leading: Icon(icon, color: active,),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => className));
            },
          ),
    );
  }