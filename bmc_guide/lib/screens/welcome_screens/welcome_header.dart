import 'package:flutter/material.dart';

class WelcomeHeader extends StatefulWidget {
  @override
  _WelcomeHeaderState createState() => _WelcomeHeaderState();
}

class _WelcomeHeaderState extends State<WelcomeHeader> {
  final String TimeBurner = "Timeburner";
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    const headerHeight = 130.0;
    return new Container(
      height: headerHeight,
      decoration: new BoxDecoration(
        boxShadow: <BoxShadow>[
          new BoxShadow(
              spreadRadius: 2.0,
              blurRadius: 4.0,
              offset: new Offset(0.0, 1.0),
              color: Colors.black38),
        ],
      ),
      child: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // linear gradient
          new Container(
            height: headerHeight,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: <Color>[
                //7928D1
                const Color(0xFF0075D1),
                const Color(0xFF00A2E3),
              ], stops: <double>[
                0.3,
                0.5
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(
                top: topPadding, left: 15.0, right: 15.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: 15),
                  child: _buildTitle(),
                ),
                _buildTotalStats()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return new Text("Welcome to BMC Guide",
        style: new TextStyle(
            fontFamily: TimeBurner,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 25.0,
            letterSpacing: 1.0));
  }

  Widget _buildTotalStats() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildTotalStat("Locations", '15'),
        _buildVerticalDivider(),
        _buildTotalStat("Restaurants", '25'),
        _buildVerticalDivider(),
        _buildTotalStat("Services", '0'),
      ],
    );
  }

  Widget _buildTotalStat(String title, String value) {
    final titleStyle = new TextStyle(
        fontSize: 16.0, fontFamily: TimeBurner, color: Colors.white);
    final valueStyle = new TextStyle(
        fontFamily: TimeBurner,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.white);
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(title, style: titleStyle),
        new Text(value, style: valueStyle),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return new Container(
      height: 30.0,
      width: 1.0,
      color: Colors.white30,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
