import 'package:flutter/material.dart';
import 'package:travel_ui/models/destination_model.dart';
import 'package:travel_ui/screens/destination_detail_page.dart';

class DestinationCard extends StatefulWidget {
  DestinationCard({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationCardState createState() => _DestinationCardState(destination);
}

class _DestinationCardState extends State<DestinationCard> {
  final Destination destination;
  _DestinationCardState(this.destination);

  void _goToDestination() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DestinationDetailPage(
                  destination: this.destination,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToDestination,
      child: Container(
        width: 210,
        margin: EdgeInsets.only(top: 5, bottom: 5),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 8.0,
                    ),
                  ],
                ),
                height: 120,
                width: 190,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8, right: 14, left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Text(
                        '${destination.activities.length} activities',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(destination.description,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6)
                  ]),
              child: Hero(
                tag: this.destination.imageUrl,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      height: 180,
                      width: 160,
                      fit: BoxFit.cover,
                      image: AssetImage(destination.imageUrl),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
