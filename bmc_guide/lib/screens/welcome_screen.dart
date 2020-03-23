import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'images/aba_payment_card_banner_kh.jpg',
  'images/ABA-CAO-LP-KH.jpg',
  'images/Fixed-Deposit-KH-3.jpg',
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //Vertical carousel
  final CarouselSlider verticalScrollCarousel = CarouselSlider(
    scrollDirection: Axis.vertical,
    aspectRatio: 2.0,
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 0.9,
    pauseAutoPlayOnTouch: Duration(seconds: 3),
    items: imgList.map(
      (url) {
        return Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.asset(
              url,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
          ),
        );
      },
    ).toList(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMC Guide'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(3.0),
                children: <Widget>[
                  makeDashboardItem("Travel", Icons.location_on),
                  makeDashboardItem("Restaurant", Icons.restaurant),
                  makeDashboardItem("Service", Icons.payment),
                  makeDashboardItem("Sponsor Us", Icons.add_circle_outline)
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Main Sponsors',style: TextStyle(fontSize: 17),),
                  ),
                ),
                verticalScrollCarousel,
              ])),
        ],
      ),
      drawer: DrawerNavigation(),
    );
  }

  //card
  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 2,
        margin: new EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Theme.of(context).primaryColor,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).primaryColor)),
                )
              ],
            ),
          ),
        ));
  }
}
