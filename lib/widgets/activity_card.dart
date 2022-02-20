import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/activity_model.dart';

class ActivityCard extends StatefulWidget {
  ActivityCard({Key key, this.activity}) : super(key: key);

  final Activity activity;

  @override
  _ActivityCardState createState() => _ActivityCardState(this.activity);
}

class _ActivityCardState extends State<ActivityCard> {
  final Activity activity;
  _ActivityCardState(this.activity);

  List<Widget> _renderRating() {
    List<Widget> ratings = <Widget>[];
    for (int i = 0; i < this.activity.rating; i++) {
      ratings.add(Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Icon(
          FontAwesomeIcons.solidStar,
          size: 12,
          color: Colors.yellow,
        ),
      ));
    }
    for (int j = 0; j < 5 - this.activity.rating; j++) {
      ratings.add(Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Icon(
          FontAwesomeIcons.star,
          size: 12,
          color: Colors.yellow,
        ),
      ));
    }
    return ratings;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: EdgeInsets.only(top: 10),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            right: 16,
            child: Container(
              height: 160,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      color: Colors.black12,
                      offset: Offset(0, 0)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 100),
                  Container(
                    width: 235,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 170,
                              child: Text(
                                this.activity.name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    '\$${this.activity.price}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text('per pax',
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          this.activity.type,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: _renderRating(),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 8, right: 8),
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).accentColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(this.activity.startTimes[0]),
                                ],
                              ),
                            ),
                            Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 8, right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Theme.of(context).accentColor),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(this.activity.startTimes[1]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        color: Colors.black12,
                        offset: Offset(2, 0))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  width: 120,
                  height: 140,
                  fit: BoxFit.cover,
                  image: AssetImage(this.activity.imageUrl),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
