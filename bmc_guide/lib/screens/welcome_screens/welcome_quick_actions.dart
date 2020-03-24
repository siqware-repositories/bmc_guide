import 'package:bmc_guide/screens/home_screens/home_screen.dart';
import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final whiteGradient = const LinearGradient(colors: const <Color>[
      const Color(0xFFFFFFFF),
      const Color(0xFFFFFFFF),
    ], stops: const <double>[
      0.6,
      0.8
    ], begin: Alignment.bottomRight, end: Alignment.topLeft);
    return new Container(
      constraints: const BoxConstraints(maxHeight: 120.0),
      margin: const EdgeInsets.only(top: 10.0),
      child: new Align(
        alignment: Alignment.center,
        child: new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
                left: 10.0, bottom: 20.0, right: 10.0, top: 10.0),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildAction("Location\nGuide", () {Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) => HomeScreen()));}, Colors.blue, whiteGradient,
                  new AssetImage("assets/images/map.png")),
              _buildAction("Restaurant\nCafe", () {}, Colors.purple,
                  whiteGradient, new AssetImage("assets/images/dish.png")),
              _buildAction(
                  "Services\nFly\nCar...",
                  () {},
                  Colors.red,
                  whiteGradient,
                  new AssetImage("assets/images/credit-card.png")),
              _buildAction("Sponsor", () {}, Colors.red, whiteGradient,
                  new AssetImage("assets/images/plus.png")),
            ]),
      ),
    );
  }

  Widget _buildAction(String title, VoidCallback action, Color color,
      Gradient gradient, ImageProvider backgroundImage) {
    final textStyle = new TextStyle(color: Color(0xFF00A2E3), fontSize: 17.0);

    return new GestureDetector(
      onTap: action,
      child: new Container(
        margin: const EdgeInsets.only(right: 5.0, left: 5.0),
        width: 150.0,
        decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: Colors.black38,
                  blurRadius: 4.0,
                  spreadRadius: 0,
                  offset: new Offset(0.0, 0.0)),
            ],
            gradient: gradient),
        child: new Stack(
          children: <Widget>[
            new Opacity(
              opacity: 0.4,
              child: new Align(
                alignment: Alignment.centerRight,
                child: new ClipPath(
                  child: new Container(
                    padding: const EdgeInsets.only(
                        bottom: 0.0, top: 20.0, right: 5.0, left: 60.0),
                    child: Image(
                      width: 60.0,
                      height: 60.0,
                      image: backgroundImage != null
                          ? backgroundImage
                          : new AssetImage("assets/images/microphone.png"),
                    ),
                  ),
                ),
              ),
            ), // END BACKGROUND IMAGE

            new Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: new Text(title, style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}