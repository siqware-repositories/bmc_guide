import 'package:bmc_guide/screens/welcome_screens/welcome_header.dart';
import 'package:bmc_guide/screens/welcome_screens/welcome_quick_actions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Profile Challenge', home: WelcomeScreenPage());
  }
}

class WelcomeScreenPage extends StatefulWidget {
  @override
  _WelcomeScreenPageState createState() => _WelcomeScreenPageState();
}

class _WelcomeScreenPageState extends State<WelcomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          WelcomeHeader(),
          QuickActions(),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: <Widget>[
                WelcomeList(
                  icon: Icon(
                    Icons.map,
                    color: Colors.white,
                  ),
                  title: 'Popular Place',
                  subtitle: 'Explore popular place',
                ),
                SizedBox(
                  height: 10,
                ),
                WelcomeList(
                  icon: Icon(Icons.restaurant, color: Colors.white),
                  title: 'Popular Resturant/Coffee',
                  subtitle: 'Find your favorite',
                ),
                SizedBox(
                  height: 10,
                ),
                WelcomeList(
                  icon: Icon(Icons.explore, color: Colors.white),
                  title: 'Blog',
                  subtitle: 'Visit the blogs',
                ),
              ],
            ),
          ),
          homeScreenBottom
        ],
      ),
    );
  }
}

//list
class WelcomeList extends StatefulWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  WelcomeList({Key key, this.icon, this.title, this.subtitle})
      : super(key: key);

  @override
  _WelcomeListState createState() => _WelcomeListState();
}

class _WelcomeListState extends State<WelcomeList> {
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD1DCFF),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 5.0, // has the effect of extending the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF00A2E3),
                  ),
                  child: widget.icon,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF00A2E3),
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xFF00A2E3),
            )
          ],
        ),
      ),
    );
  }
}

//card
final Widget homeScreenBottom = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Our Main Sponsors",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700)),
          Spacer(),
          Builder(
              builder: (BuildContext context) => Text(
                    "Add Sponsor",
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).primaryColor),
                  ))
        ],
      ),
    ),
    Container(
      height: 210,
      child: ListView(scrollDirection: Axis.horizontal, children: sponsorCards),
    )
  ],
);
List<SponsorCard> sponsorCards = [
  SponsorCard("assets/images/yeac.png"),
  SponsorCard("assets/images/giz.png"),
  SponsorCard("assets/images/ABA-CAO-LP-KH.jpg"),
  SponsorCard("assets/images/aba_payment_card_banner_kh.jpg"),
  SponsorCard("assets/images/Fixed-Deposit-KH-3.jpg"),
];

class SponsorCard extends StatefulWidget {
  final String imagePath;
  SponsorCard(this.imagePath);

  @override
  _SponsorCardState createState() => _SponsorCardState();
}

class _SponsorCardState extends State<SponsorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ClipRRect(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(widget.imagePath),
              ),
              // child: PNetworkImage(
              //   imagePath,
              //   fit: BoxFit.cover,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class PNetworkImage extends StatefulWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const PNetworkImage(this.image, {Key key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  _PNetworkImageState createState() => _PNetworkImageState();
}

class _PNetworkImageState extends State<PNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/placeholder.jpg',
        fit: BoxFit.cover,
      ),
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
    );
  }
}
