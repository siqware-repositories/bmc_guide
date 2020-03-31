import 'package:bmc_guide/app/plugins/p_network_image.dart';
import 'package:bmc_guide/screens/destination_screen/destination_screen.dart';
import 'package:flutter/material.dart';


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
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => 
                new AboutThisPlace(
                  imagePath, cityName, 'Good luck', [imagePath, imagePath]
                )
              )
            );
          },
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
                          "%",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}