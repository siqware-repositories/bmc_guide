import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMC Guide'),
      ),
      body: Center(
        child: Text('Welcome Page'),
      ),
      drawer: DrawerNavigation(),
    );
  }
}