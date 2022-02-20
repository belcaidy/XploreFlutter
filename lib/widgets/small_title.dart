import 'package:flutter/material.dart';

class SmallTitle extends StatefulWidget {
  SmallTitle({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SmallTitleState createState() => _SmallTitleState(title);
}

class _SmallTitleState extends State<SmallTitle> {
  final String title;
  _SmallTitleState(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 14, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
