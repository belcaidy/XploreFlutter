import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterableIcons extends StatefulWidget {
  FilterableIcons({Key key}) : super(key: key);

  @override
  _FilterableIconsState createState() => _FilterableIconsState();
}

class _FilterableIconsState extends State<FilterableIcons> {
  int _selectedIndex = 0;
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Theme.of(context).accentColor
                  : Color(0xFFE7EBEE),
              borderRadius: BorderRadius.circular(30.0)),
          child: Icon(
            _icons[index],
            size: 25,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _icons
            .asMap()
            .entries
            .map((MapEntry map) => _buildIcon(map.key))
            .toList(),
      ),
    );
  }
}
