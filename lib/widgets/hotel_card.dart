import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/hotel_model.dart';

class HotelCard extends StatefulWidget {
  HotelCard({Key key, this.hotel}) : super(key: key);

  final Hotel hotel;

  @override
  _HotelCardState createState() => _HotelCardState(hotel);
}

class _HotelCardState extends State<HotelCard> {
  final Hotel hotel;
  _HotelCardState(this.hotel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0, 0),
                        color: Colors.black12)
                  ]),
              height: 140,
              width: 290,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 64),
                        Text(
                          hotel.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        Text('\$${hotel.price.toString()}'),
                        Text(hotel.address,
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 45, right: 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                border: Border.all(color: Colors.black12)),
                            child: Icon(FontAwesomeIcons.star,
                                size: 20,
                                color: Theme.of(context).primaryColor)),
                        Container(
                            margin: EdgeInsets.only(top: 45),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                border: Border.all(color: Colors.black12)),
                            child: Icon(FontAwesomeIcons.phone,
                                size: 20,
                                color: Theme.of(context).primaryColor)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4))
                ]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(hotel.imageUrl),
                  width: 270,
                  height: 190,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
