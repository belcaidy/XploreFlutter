import 'package:flutter/material.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/widgets/destination_card.dart';
import 'package:travel_ui/widgets/small_title.dart';

class DestinationsCarousel extends StatefulWidget {
  DestinationsCarousel({Key key}) : super(key: key);

  @override
  _DestinationsCarouselState createState() => _DestinationsCarouselState();
}

class _DestinationsCarouselState extends State<DestinationsCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SmallTitle(title: "Top Destinations"),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                return DestinationCard(
                  destination: destinations[index],
                );
              }),
        )
      ],
    );
  }
}
