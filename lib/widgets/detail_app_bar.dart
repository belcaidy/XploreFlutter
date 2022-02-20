import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination_model.dart';

class DetailAppBar extends StatefulWidget {
  DetailAppBar({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DetailAppBarState createState() => _DetailAppBarState(this.destination);
}

class _DetailAppBarState extends State<DetailAppBar> {
  final Destination destination;
  _DetailAppBarState(this.destination);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: Hero(
        tag: this.destination.imageUrl,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        color: Colors.black26,
                        offset: Offset(0, 3))
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Image(
                  image: AssetImage(destination.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.black45,
                        Colors.black26,
                        Colors.transparent
                      ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      tileMode: TileMode.repeated),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.destination.city,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        this.destination.country,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floating: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft)),
      expandedHeight: 273,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.search,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.bars, size: 20),
        )
      ],
    );
  }
}
