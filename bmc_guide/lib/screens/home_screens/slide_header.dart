import 'package:bmc_guide/app/plugins/p_network_image.dart';
import 'package:bmc_guide/screens/destination_screen/destination_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<dynamic> imgList = [
  {
    'img':
        "https://media-cdn.tripadvisor.com/media/daodao/photo-w/14/51/dc/67/caption.jpg",
    'title': 'Title 10',
  },
  {
    'img':
        "https://twocantravel.com/wp-content/uploads/2016/07/Koh-Rong-Samloem-Tropicalife.net_.jpg",
    'title': 'Title 20',
  },
  {
    'img':
        "https://www.touropia.com/gfx/d/ten-wonders-of-the-world/angkor.jpg?v=1",
    'title': 'Title 390',
  },
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class SlideHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Object child = map<Widget>(
      imgList,
      (index, i) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => 
                  AboutThisPlace(
                    i['img'], i['title'],'Good luck', [i['img'], i['img']]
                  )
                )
              );
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                child: Stack(children: <Widget>[
                  PNetworkImage(
                    i['img'],
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
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: Text(
                        i['title'],
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
            ));
      },
    ).toList();
//Manually operated Carousel
    final CarouselSlider manualCarousel = CarouselSlider(
      items: child,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(children: [
          manualCarousel, //Header slide
        ]));
  }
}
