import 'package:bmc_guide/helpers/item_card.dart';
import 'package:flutter/material.dart';

List<ItemCard> itemCard = [
  ItemCard(
        "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
        "Kathmandu",
        "12 Feb",
        "10",
        "500",
        '440'
      ),
];

class TravelHome extends StatelessWidget {
  static final String path = "lib/src/pages/travel/travel_home.dart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[HomeScreenTop(), homeScreenBottom],
      ),
    );
  }
}

class HomeScreenTop extends StatefulWidget {
  @override
  _HomeScreenTopState createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<HomeScreenTop> {
  final TextStyle dropdownMenuLabel =
      TextStyle(color: Colors.white, fontSize: 16);
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  var selectedLocationIndex = 0;
  bool isflightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xfffb53c6), Color(0xffb91d73)])),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 250,
                    child: Text(
                      "Where do you want to go ?",
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: TextEditingController(text: ''),
                      cursorColor: Theme.of(context).primaryColor,
                      style: dropdownMenuItem,
                      decoration: InputDecoration(
                        hintText: 'Search your place...',
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(Icons.search),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 13
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          setState(() {
                            isflightSelected = true;
                          });
                        },
                        child: ChoiceChip(
                            Icons.flight_takeoff, "Flights", isflightSelected)),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isflightSelected = false;
                        });
                      },
                      child: ChoiceChip(
                        Icons.hotel, "Hotel", !isflightSelected
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isflightSelected;
  ChoiceChip(this.icon, this.text, this.isflightSelected);
  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: widget.isflightSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.text, style: TextStyle(color: Colors.white, fontSize: 14))
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height - 53);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 14);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

final Widget homeScreenBottom = Column(
  children: <Widget>[
    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.max,
    //     children: <Widget>[
    //       // Text('Travel Place',
    //       //   style: TextStyle(
    //       //     color: Colors.black87,
    //       //     fontSize: 15,
    //       //     fontWeight: FontWeight.w700
    //       //   )
    //       // ),
    //       // Spacer(),
    //       // Builder(
    //       //   builder: (BuildContext context) => GestureDetector(
    //       //     onTap: (){
               
    //       //     },
    //       //     child: Text(
    //       //     "View All",
    //       //     style: TextStyle(
    //       //       fontSize: 14, color: Theme.of(context).primaryColor
    //       //     ),
    //       //   ),
    //       //   )
    //       // ),
    //       // Padding(padding: const EdgeInsets.only(bottom: 40))
    //     ],
    //   ),
    // ),
    
    Container(
      height: 210,
      child: ListView(scrollDirection: Axis.horizontal, children: itemCard),
    ),
    Padding(padding: const EdgeInsets.only(bottom: 40))
  ],
);

