import 'package:flutter/material.dart';
import 'package:travel_ui/models/hotel_model.dart';
import 'package:travel_ui/widgets/hotel_card.dart';
import 'package:travel_ui/widgets/small_title.dart';

class HotelsCarousel extends StatefulWidget {
  HotelsCarousel({Key key}) : super(key: key);

  @override
  _HotelsCarouselState createState() => _HotelsCarouselState();
}

class _HotelsCarouselState extends State<HotelsCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SmallTitle(title: "Exclusive Hotels"),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              return HotelCard(
                hotel: hotels[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
