import 'package:bmc_guide/app/plugins/p_network_image.dart';
import 'package:bmc_guide/screens/detail_screen/place_detail_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://images.squarespace-cdn.com/content/v1/5b606ebf365f0294254cb375/1566934084440-8NGMNP6HR39UJ8KCC55X/ke17ZwdGBToddI8pDm48kCs9k2FwnVEVjbmR4eFa3A97gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1US1QWbElf81Ctymx2zwlloFEHczpBX4WMgQEAHIayrQmtUU3Qk7m8xNTwgYptIWVug/07_Sunset_Beach_TigerTails_Day1_Caucasian_Mil_11273-1.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQH5l8qA6Y9Rql_bCkaGGnN_b2xGOYeWYLzKuVzA78C22CEOAU9'
];

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        child: Stack(children: <Widget>[
          PNetworkImage(
            i,
            fit: BoxFit.cover,
            width: 1000,
          ),
          // Image.network(i, fit: BoxFit.cover, width: 1000.0),
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
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Text(
                'No. $index image ',
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

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Manually operated Carousel
  final CarouselSlider manualCarousel = CarouselSlider(
    items: child,
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: 0.9,
    aspectRatio: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Column(children: [
                manualCarousel, //Header slide
              ])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Tavel Lovation",
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
                                builder: (context) => new TravelHome()));
                          },
                        ))
              ],
            ),
          ),
          Container(
            height: 210,
            child: ListView(
                scrollDirection: Axis.horizontal, children: travelPlaceCard),
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
                    builder: (BuildContext context) => Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
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
                    builder: (BuildContext context) => Text(
                          "View All",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ))
              ],
            ),
          ),
          Container(
            height: 210,
            child:
                ListView(scrollDirection: Axis.horizontal, children: hotelCard),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}

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

class ItemCard extends StatelessWidget {
  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;
  ItemCard(this.imagePath, this.cityName, this.monthYear, this.discount,
      this.oldPrice, this.newPrice);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        child: Stack(
          children: <Widget>[
            Container(
              width: 160,
              height: 210,
              child: PNetworkImage(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              width: 160,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12])),
              ),
            ),
            Positioned(
              left: 10,
              bottom: 10,
              width: 145,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cityName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                      ),
                      Text(
                        monthYear,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        "$discount%",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
