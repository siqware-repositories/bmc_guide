import 'package:bmc_guide/helpers/drawer_navigation.dart';
import 'package:bmc_guide/helpers/item_card.dart';
import 'package:bmc_guide/page/main_page.dart';
import 'package:bmc_guide/screens/home_screens/slide_header.dart';
import 'package:flutter/material.dart';

String cover;

final Widget placeholder = Container(color: Colors.grey);

List<ItemCard> travelPlaceCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "ប្រាសាទកោះគេ",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://kohsantepheapdaily.com.kh/wp-content/uploads/2019/12/d87365f00eaf4dfa813c1d848539bb37-8.jpg",
      "បន្ទាយឆ្មារ",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard("https://i.imgur.com/AWdLPAp.jpg", "អាង ទំពាំងថ្ម", "12 Feb", "10",
      "500", '440'),
];

List<ItemCard> restaurantCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Bhaktapur",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2014/07/01/12/35/taxi-cab-381233_960_720.jpg",
      "Morang",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Bhaktapur",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2014/07/01/12/35/taxi-cab-381233_960_720.jpg",
      "Morang",
      "12 Feb",
      "10",
      "500",
      '440'),
];
List<ItemCard> hotelCard = [
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Bhaktapur",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2014/07/01/12/35/taxi-cab-381233_960_720.jpg",
      "Morang",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2013/03/02/02/41/city-89197_960_720.jpg",
      "Kathmandu",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg",
      "Bhaktapur",
      "12 Feb",
      "10",
      "500",
      '440'),
  ItemCard(
      "https://cdn.pixabay.com/photo/2014/07/01/12/35/taxi-cab-381233_960_720.jpg",
      "Morang",
      "12 Feb",
      "10",
      "500",
      '440'),
];



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home Page'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFF00A2E3),Color(0xFF0075D1)])),
          ),
        ),
        drawer: DrawerNavigation(),
      body: ListView(
        children: <Widget>[
          SlideHeader(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Tavel Location",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Builder(
                    builder: (BuildContext context) => GestureDetector(
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => new MainPage(0)));
                          },
                        ))
              ],
            ),
          ),
          Container(
            height: 210,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: travelPlaceCard
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Restaurant",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Builder(
                    builder: (BuildContext context) => GestureDetector(
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => new MainPage(3)));
                          },
                        ))
              ],
            ),
          ),
          Container(
            height: 210,
            child: ListView(
                scrollDirection: Axis.horizontal, children: restaurantCard),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Hotel",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Spacer(),
                Builder(
                    builder: (BuildContext context) => GestureDetector(
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (context) => new MainPage(1)));
                          },
                        ))
              ],
            ),
          ),
          Container(
            height: 210,
            child:
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: hotelCard
                ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}

